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
      // download Name
      self.state = .DownloadingName
    } else if self.state == .DownloadingName {
      //
    }
  }

}

//{
//  "id": 1,
//  "name": "Leanne Graham",
//  "username": "Bret",
//  "email": "Sincere@april.biz",
//  "address": {
//    "street": "Kulas Light",
//    "suite": "Apt. 556",
//    "city": "Gwenborough",
//    "zipcode": "92998-3874",
//    "geo": {
//      "lat": "-37.3159",
//      "lng": "81.1496"
//    }
//  },
//  "phone": "1-770-736-8031 x56442",
//  "website": "hildegard.org",
//  "company": {
//    "name": "Romaguera-Crona",
//    "catchPhrase": "Multi-layered client-server neural-net",
//    "bs": "harness real-time e-markets"
//  }
//}