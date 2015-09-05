//
//  ComplicationController.swift
//  DisneyWatchApp Extension
//
//  Created by punk on 8/30/15.
//  Copyright © 2015 Digital Rogues. All rights reserved.
//

import ClockKit
import RealmSwift


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    var realmToken = NotificationToken()
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.None])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        // Call the handler with the current timeline entry
        
        var entry : CLKComplicationTimelineEntry?
        let now = NSDate()
        
        if complication.family == .ModularLarge {
            
            //get the data from extensiondelegate after it has kicked off the timeline reload with the .extendtimeline call
            //let myDelegate = WKExtension.sharedExtension().delegate as! ExtensionDelegate
            
            do {
                // Persist your data easily
                let realmObj = try Realm()
                //kick off new extended timeline
                
                realmToken =  realmObj.addNotificationBlock({ (notification, realm) -> Void in
                    var magicObj = MagicIndexRealmObject()
                    magicObj = realmObj.objects(MagicIndexRealmObject).sorted("lastUpdated", ascending: false).first!
                   
                    
                    let dlrText = magicObj.dlrIndex
                    let dcaText = magicObj.dcaIndex
                    // let shortText = data[ComplicationShortTextData]
                    
                    let textTemplate = CLKComplicationTemplateModularLargeStandardBody()
                    textTemplate.headerTextProvider = CLKSimpleTextProvider(text:"disneyWatch")
                    textTemplate.body1TextProvider = CLKSimpleTextProvider(text:"DLR:\(dlrText)")
                    textTemplate.body2TextProvider = CLKSimpleTextProvider(text:"DCA:\(dcaText)")
                    
                    // Create the entry.
                    entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: textTemplate)
                    handler(entry)

                })
                
               IndexGet.getData()
                
            }
            catch{
                print(error)
            }
        }
        
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        //every hour NSDate(timeIntervalSinceNow: 60*60)
        let nextUpdateDate:NSDate = NSDate(timeIntervalSinceNow: 3600)
        
        handler(nextUpdateDate);
        
    }
    
    func requestedUpdateDidBegin() {
        
        let complicationServer = CLKComplicationServer.sharedInstance()
        for complication in complicationServer.activeComplications {
            complicationServer.extendTimelineForComplication(complication)
        }

        
        func requestedUpdateBudgetExhausted()
        {
            
        }
        
//        let myDelegate = WKExtension.sharedExtension().delegate as! ExtensionDelegate
//        myDelegate.get
        //update the data into Realm
        
//        do {
//            // Persist your data easily
//            let realmObj = try Realm()
//            IndexGet.getData()
//            //kick off new extended timeline
//              realmToken =  realmObj.addNotificationBlock({ (notification, realm) -> Void in
//                    let complicationServer = CLKComplicationServer.sharedInstance()
//                    for complication in complicationServer.activeComplications {
//                        complicationServer.extendTimelineForComplication(complication)
//                    }
//                })
//            
//        }
//        catch{
//            print(error)
//        }


    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
    
}
