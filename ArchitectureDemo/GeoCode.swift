//
//  Geo.swift
//  ArchitectureDemo
//
//  Created by Nathan Birkholz on 8/15/15.
//  Copyright (c) 2015 natebirkholz. All rights reserved.
//

import Foundation
import CoreLocation

class GeoCode {
  let id : Int

  var lat : Int
  var lon : Int
  var location : CLLocation

  init (id: Int, lat: Int, lon: Int) {
    self.id = id
    self.lat = lat
    self.lon = lon

    let latDeg = Double(lat) as CLLocationDegrees
    let lonDeg = Double(lon) as CLLocationDegrees


    var locationFor = CLLocation(latitude: latDeg, longitude: lonDeg)

    self.location = locationFor
  }
  
} // End