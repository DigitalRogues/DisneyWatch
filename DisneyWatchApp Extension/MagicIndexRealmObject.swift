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
    
    
    dynamic var dlrIndex:String = ""
    dynamic var dcaIndex:String = ""
    dynamic var lastUpdated:String = ""
    
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
