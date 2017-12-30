//
//  Observation.swift
//  SevereWxApp
//
//  Created by michael on 30/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import Foundation

class Observation {
    
    var obsType: String
    var gradation: String
    var lat: Float
    var lon: Float

    init(obsType: String, gradation: String, lat: Float, lon: Float) {
        self.obsType=obsType
        self.gradation=gradation
        self.lat=lat
        self.lon=lon
    }
    
    func getObsType() -> String {
        return self.obsType
    }
    
    func getGradation() -> String {
        return self.gradation
    }
    
    func getLat() -> Float {
        return self.lat
    }
    
    func getLon() -> Float {
        return self.lon
    }
    
}
