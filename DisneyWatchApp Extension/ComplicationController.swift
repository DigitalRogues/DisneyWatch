//
//  ComplicationController.swift
//  DisneyWatcher WatchKit Extension
//
//  Created by punk on 9/19/15.
//  Copyright © 2015 Digital Rogues. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    var lastUpdated = ""
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.None])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let now = NSDate()
        handler(now)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let now = NSDate()
        handler(now)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        let api = IndexGet()
        api.drGET(NSURL(string: "https://disney.digitalrecall.net")!) { (magicObj, error) -> Void in
            
            self.lastUpdated = magicObj!.lastUpdated
            
            let entry =  self.createTimeLineEntry(magicObj!, compFamily: complication)
            handler(entry)
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
        // somehow get this to run 1/2 after the current entry, where entries still start at the top of the hour
        
        let lastDate = NSDate(timeIntervalSince1970: Double(self.lastUpdated)!)
        let updateTime = lastDate + 30.minutes
        print(updateTime)
        handler(updateTime);
    }
    
    func requestedUpdateDidBegin() {
        print("requestedUpdated")
        let complicationServer = CLKComplicationServer.sharedInstance()
                for complication in complicationServer.activeComplications {
                    complicationServer.reloadTimelineForComplication(complication)
                }

    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        
        
        switch (complication.family) {
        case (.ModularLarge):
            let textTemplate = CLKComplicationTemplateModularLargeStandardBody()
            textTemplate.headerTextProvider = CLKSimpleTextProvider(text:"disneyWatch")
            textTemplate.body1TextProvider = CLKSimpleTextProvider(text:"DLR:Loading...")
            textTemplate.body2TextProvider = CLKSimpleTextProvider(text:"DCA:Loading...")
            handler(textTemplate)
        case (.CircularSmall):
            let textTemplate = CLKComplicationTemplateCircularSmallStackText()
            textTemplate.line1TextProvider = CLKSimpleTextProvider(text:"0")
            textTemplate.line2TextProvider = CLKSimpleTextProvider(text:"0")
            handler(textTemplate)
        default:
            print("somethings broke")
            }
        
    }
    
    func createTimeLineEntry(magicObj:MagicIndexObject, compFamily:CLKComplication)->CLKComplicationTimelineEntry
    {
        let dlrText = magicObj.dlrIndex
        let dcaText = magicObj.dcaIndex


        print(dlrText)
        print(dcaText)
        
        var entTemplate = CLKComplicationTemplate()
        switch (compFamily.family) {
        case (.ModularLarge):
            let textTemplate = CLKComplicationTemplateModularLargeStandardBody()
            textTemplate.headerTextProvider = CLKSimpleTextProvider(text:"disneyWatcher")
            textTemplate.body1TextProvider = CLKSimpleTextProvider(text:"DLR:\(dlrText)")
            textTemplate.body2TextProvider = CLKSimpleTextProvider(text:"DCA:\(dcaText)")
            entTemplate = textTemplate

        case (.CircularSmall):
            let textTemplate = CLKComplicationTemplateCircularSmallStackText()
            textTemplate.line1TextProvider = CLKSimpleTextProvider(text:"\(dlrText)")
            textTemplate.line2TextProvider = CLKSimpleTextProvider(text:"\(dcaText)")
            entTemplate = textTemplate
        default:
            print("somethings broke")
        }

        // Create the entry.
        let entryDate = NSDate(timeIntervalSince1970: Double(magicObj.lastUpdated)!)
        let entry = CLKComplicationTimelineEntry(date: entryDate, complicationTemplate: entTemplate)
        return entry
    }
    
    func returnTopOfHour() -> NSDate{
        let now = NSDate()
        let beginHour = now.beginningOfHour
        return beginHour
    }
    
}
