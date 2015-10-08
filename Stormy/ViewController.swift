//
//  ViewController.swift
//  Stormy
//
//  Created by Sachin Virdy on 9/28/15.
//  Copyright © 2015 Sachin Virdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dailyWeather: DailyWeather? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func configureView() {
        if let weather = dailyWeather {
            self.title = weather.day
        }
        
        // Configure navbar back button
        if let buttonFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
            let barButtonAttributesDictionary: [String:AnyObject]? = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: buttonFont
            ]
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributesDictionary, forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

