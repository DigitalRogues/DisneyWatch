//
//  ExtensionDelegate.swift
//  DisneyWatchApp Extension
//
//  Created by punk on 8/30/15.
//  Copyright © 2015 Digital Rogues. All rights reserved.
//

import WatchKit
//import RealmSwift
import ClockKit
class ExtensionDelegate: NSObject, WKExtensionDelegate {
    
    //var realmToken = NotificationToken()

    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
       //
//        do {
//            // Persist your data easily
//            let realmObj = try Realm()
//            //kick off new extended timeline
//            realmToken =  realmObj.addNotificationBlock({ (notification, realm) -> Void in
////                let complicationServer = CLKComplicationServer.sharedInstance()
////                for complication in complicationServer.activeComplications {
////                    complicationServer.reloadTimelineForComplication(complication)
////                }
//            })
//            
//        }
//        catch{
//            print(error)
//        }
//        
//        IndexGet.getData()

    }
    
    
    
    
    

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

}
