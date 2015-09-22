//
//  Utilities.swift
//  DisneyWatch
//
//  Created by punk on 9/15/15.
//  Copyright © 2015 Digital Rogues. All rights reserved.
//

import UIKit

class Utilities: NSObject {

  func getDocumentsURL() -> NSURL {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsURL
    }
    
  class  func fileInDocumentsDirectory(filename: String) -> String {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documentsURL.URLByAppendingPathComponent(filename)
        return fileURL.path!
        
    }
    
}
