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
    
    // Observatie toevoegen
    func addObservation(newObservation: Observation) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(newObservation)
            print("\(newObservation.obsType) is toegevoegd aan Realm")
        }
    }
    
    // Alle observaties ophalen
    func getAllObservations() -> Results<Observation> {
        let realm = try! Realm()
        
        let allObservations = realm.objects(Observation.self)
        
        for observation in allObservations {
            print("\(observation.obsType)")
        }
        
        return allObservations
    }
    
    // Verwijder alle data
    func deleteAllData() {
        let realm = try! Realm()
        
        realm.beginWrite() // Nodig voor delete
        realm.deleteAll()
    }
    
}
