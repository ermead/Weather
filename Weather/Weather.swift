//
//  Weather.swift
//  Weather
//
//  Created by Daniel Lee on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation


class Weather {
    static let mainKey = "main"
    static let descriptionKey = "description"
    static let iconStringKey = "icon"
    static let temperatureKKey = "temp"
    static let cityNameKey = "name"
    static let imageKey = "image"
    
    var main: String = ""
    var description: String = ""
    var iconString: String = ""
    var iconImageString: String = ""
    var temperatureK: Float?
    var cityName: String = ""
    var temperatureC: Float?
    
    init (jsonDictionary: [String: AnyObject]) {
        if let main = jsonDictionary[Weather.mainKey] as? String {
            self.main = main
        }
        if let description = jsonDictionary[Weather.descriptionKey] as? String {
            self.description = description
        }
        if let iconString = jsonDictionary[Weather.iconStringKey] as? String {
            self.iconString = iconString
        }
        if let temperatureK = jsonDictionary[Weather.temperatureKKey] as? Float {
            self.temperatureK = temperatureK
        }
        if let cityName = jsonDictionary[Weather.cityNameKey] as? String {
            self.cityName = cityName
        }
        if let iconImageString = jsonDictionary[Weather.imageKey] as? String {
            self.iconImageString = iconImageString
        }
    }
}