//
//  MapViewController.swift
//  SevereWxApp
//
//  Created by michael on 26/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!
    var userLocation:CLLocation!
    var mapView:GMSMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Observaties ophalen
        let repo = ObservationRepo()
        let observations = repo.getAllObservations()
        mapView = GMSMapView(frame: self.view.bounds)
        
        // Zoomlevel en mijn locatie (blauwe bol)
        mapView.setMinZoom(5, maxZoom: 20)
        mapView.isMyLocationEnabled = true
        
        self.view = mapView
        
        // Plaats marker op GoogleMap voor elke observatie
        for observation in observations {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(observation.lat, observation.lon)
            marker.title = observation.obsType
            marker.snippet = observation.gradation
            marker.map = mapView
        }
        
        // Haal mijn locatie op en centreer hierop
        determineMyCurrentLocation()
        
    }
    
    // Haal huidige locatie op
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
        
        // Centreer mapView op mijn locatie
        mapView.animate(toLocation: userLocation.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
