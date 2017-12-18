//
//  MainParentViewController.swift
//  DigitalCrib
//
//  Created by Burak Firik on 12/17/17.
//  Copyright © 2017 Burak Firik. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainParentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func logoutTapped(_ sender: Any) {
    do{
      try Auth.auth().signOut()
      navigationController?.popToRootViewController(animated: true)
    } catch {
      print("error, there was a problem signing out")
    }
    
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
