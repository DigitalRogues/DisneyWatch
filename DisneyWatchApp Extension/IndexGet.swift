//
//  IndexGet.swift
//  Digital Rogues
//
//  Created by punk on 8/23/15.
//  Copyright © 2015 Digital Rogues. All rights reserved.
//

import WatchKit
import Foundation
import RealmSwift
import ClockKit


class IndexGet: NSObject {
    

    class  func drGET(url: NSURL, callback: (MagicObject:MagicIndexRealmObject?, NSError!) -> Void)
    {
        
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.timeoutIntervalForRequest = 20
        let session = NSURLSession(configuration: sessionConfig)
        let request = NSMutableURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 200)
        //request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "GET"
        
        let task = session.dataTaskWithRequest(request) {
            (data, response, errors) in
            
            

            let json =  JSON(data: data!)
            
            
//                {
//                    "lastUpdated" : 1440946813,
//                    "parks" : {
//                        "california_adventure" : {
//                            "forecast" : "hey, it’s alright",
//                            "times" : "8:00AM to 10:00PM",
//                            "crowdIndex" : " 0"
//                        },
//                        "disneyland" : {
//                            "forecast" : "yup, it’s packed",
//                            "times" : "8:00AM to 12:00AM",
//                            "crowdIndex" : "20"
//                        },
//                        "date" : "Sunday August 30 2015"
//                    }
//            }

           
           // print(json)
            let disneyObject = MagicIndexRealmObject()
            
            if let dlr = json["parks"]["disneyland"].dictionary{
                //Now you got your value
                //print(dlr)
                disneyObject.dlrIndex = (dlr["crowdIndex"]?.stringValue)!
                disneyObject.dlrOpen = (dlr["times"]?.stringValue)!
                disneyObject.dlrForecast = (dlr["forecast"]?.stringValue)!
            }
            
            
            if let dca = json["parks"]["california_adventure"].dictionary{
                //print(dca)
                disneyObject.dcaIndex = (dca["crowdIndex"]?.stringValue)!
                disneyObject.dcaOpen = (dca["times"]?.stringValue)!
                disneyObject.dcaForecast = (dca["forecast"]?.stringValue)!
            }
            
        
            if let lastUpdated = json["lastUpdated"].number{
               // print(lastUpdated)
                disneyObject.lastUpdated = lastUpdated.stringValue
            }
            if let date = json["date"].number{
                // print(lastUpdated)
                disneyObject.date = date.stringValue
            }
            
            callback(MagicObject: disneyObject,errors)

//            if let dlr = json[0]["parks"]["disneyland"]["crowdIndex"].string{
//                print(dlr)
//            }
//            if let userName = json[0]["user"]["name"].string{
//                //Now you got your value
//            } 
        }
        task.resume()
        
    }
    
 class  func getData(){
        drGET(NSURL(string: "https://disney.digitalrecall.net")!) { (disneyObject, error) -> Void in
            
            //write to realm

            
            do {
                // Persist your data easily
                let realmObj = try Realm()
                realmObj.write{
                    print(disneyObject)
                    realmObj.add(disneyObject!)
                }
                
            }
            catch{
                print(error)
            }
            
        }
        
        
    }



}
