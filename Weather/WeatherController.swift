//
//  WeatherController.swift
//  Weather
//
//  Created by Daniel Lee on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class WeatherController {
    static let sharedInstance = WeatherController()
    
    var allWeather: [Weather] = []
    
    func searchForWeather(city: String, completion: (result: Weather?) -> Void) {
        let url = NetworkController.searchURL(city)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let resultData = resultData else {
                print("There is no Data")
                completion(result: nil)
                return
            }
            do {
                let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                
                var weatherModelObject: Weather?
                
                if let weatherDictionary = resultsAnyObject as? [String: AnyObject] {
                    weatherModelObject = Weather(jsonDictionary: weatherDictionary)
                }
                completion(result: weatherModelObject)
            } catch {
                completion(result: nil)
                
            }
        }
    }
}
