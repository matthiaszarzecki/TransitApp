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
  
  var provider_icon_url: String?
  var disclaimer: String?
  var ios_itunes_url: String?
  var ios_app_url: String?
  var android_package_name: String?
  var display_name: String?
  
  // MARK: - Setup Functions
  
  init() {
  }
  
  // MARK: - Static Functions
  
  static func getDisplayName(route: Route) -> String {
    return route.display_name != nil ? route.display_name! : "\(route.type) \(route.provider)"
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
    if let urlString = route.provider_icon_url {
      if let url = URL(string: urlString) {
        return NSURLRequest(url: url) as URLRequest
      }
    }
    return nil
  }
  
}
