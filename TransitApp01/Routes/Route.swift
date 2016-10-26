//
//  Route.swift
//  TransitApp01
//
//  Created by Matthias Zarzecki on 25/10/2016.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import Foundation

class Route {
  
  var type = ""
  var provider = ""
  var properties = ""
  var price: Dictionary<String, AnyObject>?
  var segments: Array<AnyObject>?
  
  var providerIconURL: String?
  var disclaimer: String?
  var iosItunesURL: String?
  var iosAppURL: String?
  var androidPackageName: String?
  var displayName: String?
  
  // MARK: - Setup Functions
  
  init() {
  }
  
  // MARK: - Static Functions
  
  static func getDisplayName(route: Route) -> String {
    let displayName = route.displayName
    return displayName != nil ? displayName! : "\(route.type) \(route.provider)"
  }
  
  static func getPriceString(route: Route) -> String {
    var priceString = ""
    
    if let priceDetail = route.price {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.currencyCode = (priceDetail[Keys.Currency] as? String) ?? Defaults.Currency
      if let amount = priceDetail[Keys.Amount] as? Double {
        priceString = formatter.string(from: NSNumber(value: amount * 0.01))!
      }
    }
    
    return priceString != "" ? priceString : Texts.NoPrice
  }
  
  static func getProviderIconRequestURL(route: Route) -> URLRequest? {
    if let urlString = route.providerIconURL {
      return Utilities.getURLRequest(url: urlString)
    }
    return nil
  }
  
}
