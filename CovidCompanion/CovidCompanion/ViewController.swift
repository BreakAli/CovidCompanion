//
//  ViewController.swift
//  CovidCompanion
//
//  Created by BYNC on 8/5/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var mainLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backgroundImage.image = UIImage(named:"chicagoRiver")
        mainLabel.image = UIImage(named:"chicagoLogo")
        
        
    }

    // Prepare segue depending on whih segue was used
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Segue to newItemView
         if (segue.identifier == "segueToIntro2"){
             let destVC = segue.destination as! IntroViewController2
         }
     }
    
    
    @IBAction func onStartPress(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToIntro2", sender: nil)
//        let viewController = IntroViewController2()
//        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

