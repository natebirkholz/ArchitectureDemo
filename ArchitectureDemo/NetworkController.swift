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
        self.networkQueue.addOperationWithBlock { () -> Void in
            let idString =  String(person.idFor)
            let requestString = self.apiURL + idString
            
            let fetchUrl = NSURL(string: requestString)
            let fetchSession = NSURLSession.sharedSession()
            var request = NSMutableURLRequest(URL: fetchUrl!)
            request.HTTPMethod = "GET"
            
            let dataTask = fetchSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                let dataFromRequest = data as NSData
                if let httpResponse = response as! NSHTTPURLResponse {
                    
                }
            })
        }
//        self.fetchJSONFromURL(self.apiURL, completionHandler: { (dataFromURL) -> (Void) in
//            let parser = JsonParser()
//            var forecasts = parser.parseJSONIntoForecasts(dataFromURL)
//            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
//                completionHandler(forecasts: forecasts)
//            })
//        })
    }
    
    func fetchJSONFromURL(aURL: String, completionHandler : (dataFromURL: NSData) -> (Void)) {
        let fetchURL = NSURL(string: aURL)
        let fetchSession = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: fetchURL!)
        request.HTTPMethod = "GET"
        
        let dataTask = fetchSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let dataFromRequest = data as NSData
            if let httpResponse = response as? NSHTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    completionHandler(dataFromURL: dataFromRequest)
                default:
                    println("ERROR: Bad response")
                    completionHandler(dataFromURL: dataFromRequest)
                }
            } else {
                println("NO RESPONSE------")
            }
        })
        dataTask.resume()
    }
    
} // End