//
//  Section.swift
//  SevereWxApp
//
//  Created by michael on 29/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import Foundation

struct Section{
    var obsType: String!
    var obsTypeGradations: [String]!
    var expanded: Bool!
    
    init(obsType: String, obsTypeGradations: [String], expanded: Bool) {
        self.obsType=obsType
        self.obsTypeGradations=obsTypeGradations
        self.expanded=expanded
    }
}
