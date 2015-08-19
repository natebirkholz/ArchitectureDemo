//
//  Address.swift
//  ArchitectureDemo
//
//  Created by Nathan Birkholz on 8/15/15.
//  Copyright (c) 2015 natebirkholz. All rights reserved.
//

import Foundation


class Address {
  let id : Int

  var street : String?
  var suite : String?
  var city : String?
  var zipcode : String?
  var geo : GeoCode?

  init(id: Int, street: String, suite: String, city: String, zipcode: String, lat: Int, lon: Int) {
    self.id = id
    self.street = street
    self.suite = suite
    self.city = city
    self.zipcode = zipcode
    let geoFor = GeoCode(id: id, lat: lat, lon: lon)
  }
  
} // End

