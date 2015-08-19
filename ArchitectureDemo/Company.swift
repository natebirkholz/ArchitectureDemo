//
//  Company.swift
//  ArchitectureDemo
//
//  Created by Nathan Birkholz on 8/15/15.
//  Copyright (c) 2015 natebirkholz. All rights reserved.
//

import Foundation

class Company {
  let id : Int
  var name : String?
  var catchPhrase : String?
  var bs : String?

  init(id: Int, name: String, catchPhrase: String, bs: String) {
    self.id = id
    self.name = name
    self.catchPhrase = catchPhrase
    self.bs = bs
  }
    
} // End

