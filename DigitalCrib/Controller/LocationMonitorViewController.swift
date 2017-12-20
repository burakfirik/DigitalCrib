//
//  LocationMonitorViewController.swift
//  DigitalCrib
//
//  Created by Burak Firik on 12/20/17.
//  Copyright © 2017 Burak Firik. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

protocol ChildLocationChangeDelegate {
  func childLocationChange()
}

class LocationMonitorViewController: UIViewController, CLLocationManagerDelegate{
  
  
  
  var manager = CLLocationManager()
  var parentId: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    manager.delegate = self
    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
      manager.startUpdatingLocation()
    } else {
      manager.requestWhenInUseAuthorization()
    }
    print(parentId)
    
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let coordinate = manager.location?.coordinate {
      var locDict = ["lat": coordinate.latitude, "lon": coordinate.longitude]
      Database.database().reference().child("users").child(parentId).child("children").setValue(locDict)
          print("Lat: \(coordinate.latitude)")
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
