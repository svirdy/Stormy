//
//  ViewController.swift
//  Stormy
//
//  Created by Sachin Virdy on 9/28/15.
//  Copyright © 2015 Sachin Virdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    
    private let forecastAPIKey = "e3c8c8c6681cb3eb7e4417e08e115037"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
        
        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
            let weatherDictionary = NSDictionary(contentsOfFile: plistPath),
        let currentWeatherDictionary = weatherDictionary["currently"] as? [String:AnyObject] {
            
            let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
            
            currentTemperatureLabel?.text = "\(currentWeather.temperature)º"
            currentHumidityLabel?.text = "\(currentWeather.humidity)%"
            currentPrecipitationLabel?.text = "\(currentWeather.precipProbability)%"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

