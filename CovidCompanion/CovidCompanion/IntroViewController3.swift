//
//  IntroViewController3.swift
//  CovidCompanion
//
//  Created by BYNC on 8/6/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import UIKit

class IntroViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // Prepare segue depending on whih segue was used
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Segue to newItemView
             if (segue.identifier == "segueToIntro3"){
                 let destVC = segue.destination as! MainViewController
             }
         }
        
        
        @IBAction func onNextPress(_ sender: UIButton) {
            performSegue(withIdentifier: "segueToMain", sender: nil)
    //        let viewController = IntroViewController2()
    //        navigationController?.pushViewController(viewController, animated: true)
        }

}
