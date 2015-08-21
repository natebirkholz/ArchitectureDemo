//
//  DataObject.swift
//  ArchitectureDemo
//
//  Created by Nathan Birkholz on 8/15/15.
//  Copyright (c) 2015 natebirkholz. All rights reserved.
//

import Foundation

enum StateFor {
    case Available
    case Queued
    case DownloadingName
    case DownloadingAddress
    case GeneratingGeoCode
    case DownloadingCompany
    case Assembling
    case Downloaded
}

class Person {
    let idFor : Int
    
    var state : StateFor
    
    var name : String?
    var firstName : String?
    var lastName : String?
    var email : String?
    var address : Address?
    var phone : String?
    var website : String?
    var company : Company?
    
    init (id: Int) {
        self.idFor = id
        self.state = .Available
    }
    
    
    func process() {
        if self.state == .Available {
            // add to queue
            self.state = .Queued
        } else if self.state == .Queued {
            let netCon = NetworkController.sharedInstance
            netCon.getJSONForPerson(self, completionHandler: { (data) -> (Void) in
                if data.length > 0 {
                    self.parseJsonForPerson(data)
                }
                
            })
            
            self.state = .DownloadingName
        } else if self.state == .DownloadingName {
            //
        }
    }
    
    func parseJsonForPerson(data: NSData) {
        var queue = JsonParser.sharedInstance.jsonQueue
        var error : NSError?
        
        queue.addOperationWithBlock { () -> Void in
            if let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error) as? [String : AnyObject] {
                if jsonDictionary["id"] == self.idFor {
                    self.name = jsonDictionary["name"]
                    var nameString = jsonDictionary["name"] as! String
                    var nameStrings = nameString.componentsSeparatedByString(" ")
                    self.firstName = nameStrings[0]
                    self.lastName = nameStrings.last
                    self.email = jsonDictionary["email"]
                    
                }
            } else {
                
            }
        }
    }
    
} // End