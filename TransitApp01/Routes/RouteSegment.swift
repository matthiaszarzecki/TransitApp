//
//  RouteSegment.swift
//  TransitApp01
//
//  Created by Matthias Zarzecki on 26/10/2016.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import Foundation

class RouteSegment {
  
  var displayName: String?
  var name: String?
  var numStops: Int?
  var travelMode: String?
  var description: String?
  var color: String?
  var iconURL: String?
  var polyline: String?
  var stops: Array<AnyObject>?
  
  init() {
  }
 
  // MARK: - Static Functions
  
  static func getSegmentDisplayName(segment: RouteSegment) -> String {
    var nameString = segment.travelMode ?? ""
    nameString += nameString != "" ? " " : ""
    nameString +=  segment.name ?? ""
    return nameString
  }
}
