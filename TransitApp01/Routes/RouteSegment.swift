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
    nameString += segment.name ?? ""
    
    if let description = segment.description {
      if description != "" {
        nameString += " - "
        nameString += description
      }
    }
    
    return nameString
  }
  
  static func getNumStopsDisplay(routeSegment: RouteSegment) -> String {
    let numStops = routeSegment.numStops ?? 0
    return numStops > 0 ? "\(String(describing: numStops)) \(Texts.Stops)" : ""
  }
  
  static func getProviderIconRequestURL(route: RouteSegment) -> URLRequest? {
    if let urlString = route.iconURL {
      return Utilities.getURLRequest(url: urlString)
    }
    return nil
  }
}
