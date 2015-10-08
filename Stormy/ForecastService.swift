//
//  ForecastService.swift
//  Stormy
//
//  Created by Sachin Virdy on 10/3/15.
//  Copyright © 2015 Sachin Virdy. All rights reserved.
//

import Foundation

struct ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    init(APIKey: String) {
            self.forecastAPIKey = APIKey
            forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
        }
    
    func getForecast(lat: Double, long: Double, completion: (Forecast? -> Void)) {
    
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL) {
            
            let networkOperation = NetworkOperation(url: forecastURL)
            
            networkOperation.downloadJSONfromURL {
                (let JSONDictionary) in
                let forecast = Forecast(weatherDictionary: JSONDictionary)
                completion(forecast)
            }
            
        } else {
            print("Could not construct a valid URL")
        }
    }
    

}