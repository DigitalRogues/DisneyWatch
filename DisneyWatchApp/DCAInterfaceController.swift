//
//  DCAInterfaceController.swift
//  DisneyWatch
//
//  Created by punk on 9/5/15.
//  Copyright © 2015 Digital Rogues. All rights reserved.
//

import WatchKit
import Foundation


class DCAInterfaceController: WKInterfaceController {

    @IBOutlet var openLabel: WKInterfaceLabel!
    @IBOutlet var outlookLabel: WKInterfaceLabel!
    @IBOutlet var indexLabel: WKInterfaceLabel!

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
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
