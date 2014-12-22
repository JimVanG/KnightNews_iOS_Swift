//
//  MapViewController.swift
//  KnightNews
//
//  Created by james van gaasbeck on 12/22/14.
//  Copyright (c) 2014 james van gaasbeck. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager: CLLocationManager
    
    required init(coder aDecoder: NSCoder) {
        self.locationManager = CLLocationManager()

        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }else {
            self.locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        }
        
        let ucfLocation = CLLocationCoordinate2D(latitude: 28.602428, longitude: -81.200060)
        
        let cam = MKMapCamera(lookingAtCenterCoordinate: ucfLocation, fromEyeCoordinate: ucfLocation, eyeAltitude: 5000)
        
        self.mapView.setCamera(cam, animated: true)
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .Authorized || status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}