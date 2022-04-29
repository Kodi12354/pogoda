//
//  ViewController.swift
//  Pogoda
//
//  Created by Гость on 29.04.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLocationManager()
    }
    func startLocationManager(){
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.stopUpdatingLocation()
        }
    }

}


extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last{
            print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
        }
    }
}
