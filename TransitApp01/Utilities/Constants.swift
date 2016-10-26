//
//  Constants.swift
//  TransitApp01
//
//  Created by Matthias Zarzecki on 25/10/2016.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import Foundation

struct Keys {
  static let ProviderAttributes = "provider_attributes"
  static let Routes = "routes"
  static let Data = "data"
  
  static let RouteType = "type"
  static let Provider = "provider"
  static let Properties = "properties"
  static let Segments = "segments"
  static let Price = "price"
  
  static let ProviderIconURL = "provider_icon_url"
  static let Disclaimer = "disclaimer"
  static let IOSiTunesURL = "ios_itunes_url"
  static let IOSAppURL = "ios_app_url"
  static let AndroidPackageName = "android_package_name"
  static let DisplayName = "display_name"
  
  static let Currency = "currency"
  static let Amount = "amount"
}

struct Texts {
  static let NoPrice = "Free!"
  static let MainMenuHeader = "Transit App 2000"
}

struct Defaults {
  static let Currency = "EUR"
}
