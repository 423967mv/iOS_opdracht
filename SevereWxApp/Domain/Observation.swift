//
//  Observation.swift
//  SevereWxApp
//
//  Created by michael on 30/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import Foundation
import RealmSwift

class Observation : Object {
    
    @objc dynamic var obsType = ""
    @objc dynamic var gradation = ""
    @objc dynamic var lat = 0.0
    @objc dynamic var lon = 0.0
    @objc dynamic var siteName = ""
    @objc dynamic var time = NSDate()
    
}
