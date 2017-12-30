//
//  ThunderstormsViewController.swift
//  SevereWxApp
//
//  Created by michael on 26/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import UIKit
import CoreLocation

class ThunderstormsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var locationManager:CLLocationManager!
    var userLocation:CLLocation!
    var currentIndexPath: IndexPath!
    
    var sections = [
        Section(obsType: "Tornado",
                obsTypeGradations: ["F0", "F1", "F2", "F3", "F4", "F5"],
                expanded: false),
        Section(obsType: "Large Hail",
                obsTypeGradations: ["2-5cm", "5cm+"],
                expanded: false),
        Section(obsType: "Wind Gusts",
                obsTypeGradations: ["Large branches downed", "Trees/power lines downed", "Buildings damaged"],
                expanded: false)
    ]
    
    // Haal huidige locatie op voor doorgeven observatie
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    // Hier komt de manipulatie van de coordinaatData
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0] as CLLocation
        
        // Nieuwe observatie aanmaken
        let newObservation = Observation()
        
        // Attributen invullen
        newObservation.obsType = sections[currentIndexPath.section].obsType
        newObservation.gradation = sections[currentIndexPath.section].obsTypeGradations[currentIndexPath.row]
        newObservation.lat = userLocation.coordinate.latitude
        newObservation.lon = userLocation.coordinate.longitude
        
        // Observatie opslaan
        let repo = ObservationRepo()
        repo.addObservation(newObservation: newObservation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // vul met dummyData
        let obsRepo = ObservationRepo()
        obsRepo.dummyObservations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // aantal secties
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // aantal rijen
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].obsTypeGradations.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded){
            return 45
        }
        // indien niet uitgeklapt is de hoogte 0
        else {
            return 0
        }
    }
    
    // spacing tussen de secties
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].obsType, section: section, delegate: self)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text=sections[indexPath.section].obsTypeGradations[indexPath.row]
        
        return cell
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableView.beginUpdates()
        for i in 0 ..< sections[section].obsTypeGradations.count{
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Actie bij het aanklikken van een rij
        // Set currentIndexPath
        currentIndexPath = indexPath
        // Bepaal mijn locatie maak observatie aan en sla deze op
        determineMyCurrentLocation()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
