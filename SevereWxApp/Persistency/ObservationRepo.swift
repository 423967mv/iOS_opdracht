//
//  File.swift
//  SevereWxApp
//
//  Created by michael on 30/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import Foundation
import RealmSwift

class ObservationRepo {
    
    func addObservation(newObservation: Observation) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(newObservation)
            print("\(newObservation.obsType) is toegevoegd aan Realm")
        }
    }
}
