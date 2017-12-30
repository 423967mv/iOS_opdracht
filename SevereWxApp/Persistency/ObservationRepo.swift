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
        obs1.obsType = "❄️ Snowfall"
        obs1.gradation = "Heavy Snow"
        obs1.lat = 51.12
        obs1.lon = 3.00
        obs1.siteName = "Koekelare"
        obs1.time = NSDate()
        
        let obs2 = Observation()
        obs2.obsType = "⛸️ Ice"
        obs2.gradation = "Freezing Rain"
        obs2.lat = 51.50
        obs2.lon = 3.75
        obs2.siteName = "'s-Heer Arendskerke"
        obs2.time = NSDate()
        
        let obs3 = Observation()
        obs3.obsType = "⛸️ Ice"
        obs3.gradation = "Ice Pellets"
        obs3.lat = 50.50
        obs3.lon = 2.75
        obs3.siteName = "Vermelles"
        obs3.time = NSDate()
        
        let obs4 = Observation()
        obs4.obsType = "⛸️ Ice"
        obs4.gradation = "Ice Pellets"
        obs4.lat = 51.20
        obs4.lon = 3.75
        obs4.siteName = "Assenede"
        obs4.time = NSDate()
        
        
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
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
