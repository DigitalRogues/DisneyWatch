//
//  MagicIndexRealmObject.swift
//  Digital Rogues
//
//  Created by punk on 8/30/15.
//  Copyright © 2015 Digital Rogues. All rights reserved.
//

import RealmSwift
import Foundation

class MagicIndexRealmObject: Object {
    
    
//    {"parks":{"date":"Saturday September 05 2015","disneyland":{"crowdIndex":"20","forecast":"yup, it’s packed","times":"9:00AM to 11:00PM"},"california_adventure":{"crowdIndex":"20","forecast":"yup, it’s packed","times":"):9:00AM to 9:00PM"}},"lastUpdated":1441470610}
//    
    
    dynamic var dlrIndex:String = ""
    dynamic var dlrOpen:String = ""
    dynamic var dlrForecast:String = ""
    
    dynamic var dcaIndex:String = ""
    dynamic var dcaOpen:String = ""
    dynamic var dcaForecast:String = ""
    
    dynamic var lastUpdated:String = ""
    dynamic var date:String = ""

    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
