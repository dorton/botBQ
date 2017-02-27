//
//  InterfaceController.swift
//  botBQ_watch Extension
//
//  Created by Brian Dorton on 2/27/17.
//  Copyright © 2017 Brian Dorton. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var pit_label: WKInterfaceLabel!
    @IBOutlet var pit_temp: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
