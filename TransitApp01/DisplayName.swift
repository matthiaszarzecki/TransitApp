//
//  DisplayName.swift
//  TransitApp01
//
//  Created by Zarzecki, Matthias on 17.01.18.
//  Copyright © 2018 Matthias Zarzecki. All rights reserved.
//

import Foundation

class DisplayName {
    static func getDisplayName(provider: String = "", type: String = "") -> String {
        if provider == "vbb" {
            return "VBB"
        }
        
        if type == "private_bike" {
            return "Ride a bicycle"
        }
        
        if type == "taxi" {
            return "Taxi"
        }
        
        return ""
    }
}
