//
//  ChildMapViewController.swift
//  DigitalCrib
//
//  Created by Burak Firik on 12/20/17.
//  Copyright © 2017 Burak Firik. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth
import FirebaseDatabase



class ChildMapViewController: UIViewController, MKMapViewDelegate, ChildLocationChangeDelegate  {
  
  @IBOutlet weak var mapView: MKMapView!
  
  var delegate:ChildLocationChangeDelegate!
  
  var parentId = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.delegate = self
    delegate = self
    observeFireBase()
    showChild()
  }
  
  func observeFireBase() {
    let database = Database.database().reference().child("users").child(parentId).observe(.childChanged) { (snapshot) in
      self.showChild()
    }
  }
  
  func showChild() {
    Database.database().reference().child("users").child(parentId).observe(.childAdded) {(snapshot) in
      
      if let userDict = snapshot.value as? NSDictionary {
        var coordinate = CLLocationCoordinate2D()
        if let lati = userDict["lat"] as? Double{
          coordinate.latitude = lati
        }
        if let long = userDict["lon"] as? Double{
          coordinate.longitude = long
        }
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
       
        let anno = MKPointAnnotation()
        anno.coordinate = coordinate
        self.mapView.addAnnotation(anno)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 300, 300)
        self.mapView.setRegion(region, animated: true)
      }
    }
  }
  
  func childLocationChange() {
    showChild()
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let annoView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
    
    annoView.image = UIImage(named:"girl")
    var frame = annoView.frame
    frame.size.height = 40
    frame.size.width = 40
    annoView.frame = frame
    
    return annoView
  }
  
  
}
