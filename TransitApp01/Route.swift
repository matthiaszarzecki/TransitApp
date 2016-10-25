//
//  Route.swift
//  TransitApp01
//
//  Created by Matthias Zarzecki on 25/10/2016.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import Foundation

class Route {
  
  var type: String = ""
  var provider: String = ""
  var properties: String = ""
  var price: Dictionary<String, AnyObject>?
  var segments: Array<AnyObject>?
  
  init() {
  }
  
}
