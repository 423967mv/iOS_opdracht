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
    
    // Plaatst 4 dummy observaties in de database
    func dummyObservations() {
        
        let realm = try! Realm()
        
        let obs1 = Observation()
        obs1.obsType="Winter"
        obs1.gradation="Heavy Snow"
        obs1.lat=51.12
        obs1.lon=3.00
        
        let obs2 = Observation()
        obs2.obsType="Winter"
        obs2.gradation="Freezing Rain"
        obs2.lat=51.50
        obs2.lon=3.75
        
        let obs3 = Observation()
        obs3.obsType="Winter"
        obs3.gradation="Ice Pellets"
        obs3.lat=50.50
        obs3.lon=2.75
        
        let obs4 = Observation()
        obs4.obsType="Winter"
        obs4.gradation="Ice Pellets"
        obs4.lat=51.20
        obs4.lon=3.75
        
        
        try! realm.write {
            realm.add(obs1)
            realm.add(obs2)
            realm.add(obs3)
            realm.add(obs4)
        }
        
    }
    
    
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
        
        return allObservations
    }
    
    // Verwijder alle data
    func deleteAllData() {
        let realm = try! Realm()
        
        realm.beginWrite() // Nodig voor delete
        realm.deleteAll()
    }
    
}
