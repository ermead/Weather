//
//  NetworkController.swift
//  Weather
//
//  Created by Daniel Lee on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

//http://api.openweathermap.org/data/2.5/weather?q=city&appid=2b971a5208ced5aeb4df6be3c3e864bf

class NetworkController {
    
    static let myAPI: String = "2b971a5208ced5aeb4df6be3c3e864bf"
    static let baseURL = "http://api.openweathermap.org/data/2.5/weather?q="
    static var url: NSURL?
    
    static func searchURL (city: String) -> NSURL {
        var city = city
        url = NSURL(string: baseURL + city + "&appid=" + myAPI)
        return NSURL(string: baseURL + city + "&appid=" + myAPI)!
    }
    
    static func dataAtURL (url: NSURL, completion: (resultData: NSData?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            guard let data = data else {
                print(error?.localizedDescription)
                print("error on networkcontroller")
                completion(resultData: nil)
                return
            }
            completion(resultData: data)
            print("result data")
            print(data)
           
            
        }
        dataTask.resume()
    }
    
}
