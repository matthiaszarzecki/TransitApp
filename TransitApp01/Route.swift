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
  
  var provider_icon_url: String?
  var disclaimer: String?
  var ios_itunes_url: String?
  var ios_app_url: String?
  var android_package_name: String?
  var display_name: String?
  
  init() {
  }
  
}
