//
//  Utilities.swift
//  TransitApp01
//
//  Created by Matthias Zarzecki on 25/10/2016.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import Foundation

class Utilities {
  
  static func getJSonFileAsDictionary(_ fileName: String = "") -> NSDictionary? {
    if let filePath = Bundle.main.path(forResource: fileName, ofType: "json"), let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
      do {
        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        return json as? NSDictionary
      } catch {
      }
    }
    return nil
  }
  
}
