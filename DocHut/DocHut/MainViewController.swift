//
//  MainViewController.swift
//  DocHut
//
//  Created by Damidu Dasanayake on 5/14/18.
//  Copyright © 2018 Damidu Dasanayake. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if segue.identifier == "screen2"{
            let VC = segue.destination as? ViewController
            VC?.capturePhoto()
        }
  }
    
    @IBAction func navigateButton(_ sender: Any) {

        performSegue(withIdentifier: "screen2", sender: self)

    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
}
