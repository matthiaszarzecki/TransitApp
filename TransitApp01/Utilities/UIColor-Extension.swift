//
//  UIColor-Extension.swift
//  TransitApp01
//
//  Created by Matthias Zarzecki on 27/10/2016.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

  static func colorFromHex(hex: String) -> UIColor {
    var colorString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
      
    if (colorString.hasPrefix("#")) {
      colorString.remove(at: colorString.startIndex)
    }
      
    if (colorString.characters.count != 6) {
      return UIColor.gray
    }
      
    var rgbValue: UInt32 = 0
    Scanner(string: colorString).scanHexInt32(&rgbValue)
    
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
      )
    }
    
}
