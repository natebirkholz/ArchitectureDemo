//
//  NetworkController.swift
//  ArchitectureDemo
//
//  Created by Nate Birkholz on 8/18/15.
//  Copyright (c) 2015 natebirkholz. All rights reserved.
//

import Foundation

class NetworkController {
    // Added an API key
    let apiURL = "http://jsonplaceholder.typicode.com/users/"
    var networkQueue = NSOperationQueue()
    
    class var sharedInstance : NetworkController {
        struct Static {
            static let instance : NetworkController = NetworkController()
        }
        return Static.instance
    }
    
    init(){
        self.networkQueue.maxConcurrentOperationCount = 6
    }
    
    func getJSONForPerson(person: Person, completionHandler : (data: NSData) ->(Void)) {
        let idString =  String(person.idFor)
        let requestString = self.apiURL + idString
        
        let fetchUrl = NSURL(string: requestString)
        let fetchSession = NSURLSession.sharedSession()
        var request = NSMutableURLRequest(URL: fetchUrl!)
        request.HTTPMethod = "GET"
        
        let dataTask = fetchSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let dataFromRequest = data as NSData
            if let httpResponse = response as? NSHTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    completionHandler(data: dataFromRequest)
                default:
                    println("Error: Bad response: \(httpResponse.statusCode)")
                    let nilData = NSData()
                    completionHandler(data: nilData)
                    // Be sure to check length of return!!!
                }
            } else {
                println("NO RESPONSE------")
                let nilData = NSData()
                completionHandler(data: nilData)
            }
        })
        dataTask.resume()
    }
    
    
} // End