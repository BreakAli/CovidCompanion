//
//  IntroViewController2.swift
//  CovidCompanion
//
//  Created by BYNC on 8/6/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import UIKit

class IntroViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // Prepare segue depending on whih segue was used
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Segue to newItemView
             if (segue.identifier == "segueToIntro3"){
                 let destVC = segue.destination as! IntroViewController3
             }
         }
        
        
        @IBAction func onNextPress(_ sender: UIButton) {
            performSegue(withIdentifier: "segueToIntro3", sender: nil)
    
        }

}
