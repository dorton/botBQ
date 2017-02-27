//
//  ViewController.swift
//  BBQBot
//
//  Created by Brian Dorton on 2/4/17.
//  Copyright © 2017 Brian Dorton. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var pitNameLabel :UILabel!
    @IBOutlet weak var probe1NameLabel :UILabel!
    @IBOutlet weak var probe2NameLabel :UILabel!
    @IBOutlet weak var pitTempLabel :UILabel!
    @IBOutlet weak var probe1TempLabel :UILabel!
    @IBOutlet weak var probe2TempLabel :UILabel!
    @IBOutlet weak var fanLabel :UILabel!
    @IBOutlet weak var timeLabel :UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { (timer) in
            
            print("Timer fired")
            
            let url = URL(string: "http://bbq.dorton.co/luci/lm/hmstatus")!
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                
                if data == nil {
                    return
                }
                
                let dictionary = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                
                let fanDictionary = dictionary["fan"] as! [String: Any]
                
                let tempArray = dictionary["temps"] as! [[String: Any]]
                
                let pit = tempArray[0];
                
                let probe1 = tempArray[1];
                
                let probe2 = tempArray[2];
                
                let numberOfPlaces = 4.0
                
                let multiplier = pow(10.0, numberOfPlaces)
                
                //                let ptTemp = pit["c"]!
                //                let p1Temp = probe1["c"]!
                
                
                //                let roundedPit = round(ptTemp as! Double * multiplier) / multiplier
                //                let roundedP1temp = round(p1Temp as! Double * multiplier) / multiplier
                
                
                
                DispatchQueue.main.async {
                    self.pitNameLabel.text = pit["n"]! as? String
                    
                    if let ptTemp = pit["c"] {
                        let roundedPit = round(ptTemp as! Double * multiplier) / multiplier
                        self.pitTempLabel.text = "\(roundedPit)"
                    }
                    
                    
                    self.probe1NameLabel.text = probe1["n"]! as? String
                    
                    
                    if let p1Temp = probe1["c"] {
                        
                        let roundedP1temp = round(p1Temp as! Double * multiplier) / multiplier
                        
                        self.probe1TempLabel.text = "\(roundedP1temp)"
                    }
                    
                    
                    
                    self.probe2NameLabel.text = probe2["n"]! as? String
                    //
                    //                    if let p2 = probe2["c"] {
                    ////
                    //                        let roundedP2temp = round((probe2["c"]) * multiplier) / multiplier
                    ////
                    //                        self.probe2TempLabel.text = "\(roundedP2temp)"
                    //                    }
                    
                    
                    
                    
                    
                    
                    if let fan = fanDictionary["c"] {
                        
                        self.fanLabel.text = "\(fan)"
                    }
                    
                    
                    if let time = dictionary["time"] {
                        
                        self.timeLabel.text = "\(time)"
                    }
                    
                    
                    
                }
                
                
                
                
                
                
                print(dictionary["time"]!)
                print(fanDictionary["c"]!)
                
                print(pit["n"]!)
                //                print(roundedPit)
                
                print(probe1["n"]!)
                //                print(roundedP1temp)
                
                print(probe2["n"]!)
                
                
                
                
                }.resume()
            
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

