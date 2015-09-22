//
//  GlanceController.swift
//  DisneyWatchApp Extension
//
//  Created by punk on 8/30/15.
//  Copyright © 2015 Digital Rogues. All rights reserved.
//

import WatchKit
import Foundation
//import RealmSwift


class GlanceController: WKInterfaceController {

    @IBOutlet var dlrLabel: WKInterfaceLabel!
    @IBOutlet var dcaLabel: WKInterfaceLabel!
   // var realmToken = NotificationToken()
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
//        // Configure interface objects here.
//        do {
//            // Persist your data easily
//            let realmObj = try Realm()
//            //kick off new extended timeline
//            
//            realmToken =  realmObj.addNotificationBlock({ (notification, realm) -> Void in
//                var magicObj = MagicIndexRealmObject()
//                magicObj = realmObj.objects(MagicIndexRealmObject).sorted("lastUpdated", ascending: false).first!
//                
//                self.dlrLabel.setText(magicObj.dlrIndex)
//                self.dcaLabel.setText(magicObj.dcaIndex)
//            })
//            
//            IndexGet.getData()
//            
//        }
//        catch{
//            print(error)
//        }
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
