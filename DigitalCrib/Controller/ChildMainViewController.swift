//
//  ChildMainViewController.swift
//  DigitalCrib
//
//  Created by Burak Firik on 12/20/17.
//  Copyright © 2017 Burak Firik. All rights reserved.
//

import UIKit
import MapKit

class ChildMainViewController: UIViewController, CLLocationManagerDelegate {
  
  @IBOutlet weak var parentIdTextField: UITextField!
  
  
  @IBAction func reportMyLocationTapped(_ sender: Any) {
    performSegue(withIdentifier: "locationMonitorSegue", sender: self)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
   
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let locationVC = segue.destination as? LocationMonitorViewController {
      if let parentId = parentIdTextField.text {
        locationVC.parentId = parentId
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
