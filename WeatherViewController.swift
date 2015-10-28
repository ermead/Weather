//
//  WeatherViewController.swift
//  Weather
//
//  Created by Daniel Lee on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButtontapped(sender: AnyObject) {
        if let cityText = textField.text {
        WeatherController.sharedInstance.searchForWeather(cityText, completion: { (result) -> Void in
            guard let weatherResult = result else {print("Something");return}
            
            //dispatch_async(dispatch_get_main_queue()) { () in
                
            print(weatherResult.cityName)
            print(weatherResult.description)
            print(weatherResult.temperatureK)
            print(weatherResult.main)
        })
            }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
