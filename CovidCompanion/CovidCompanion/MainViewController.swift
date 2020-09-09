//
//  MainViewController.swift
//  CovidCompanion
//
//  Created by BYNC on 8/6/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var star1: UIImageView!
    
    @IBOutlet weak var star2: UIImageView!
    
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    
    @IBOutlet weak var star5: UIImageView!
    
    @IBOutlet weak var star6: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    

    @IBAction func onHubPress(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToHub", sender: nil)
    }
    
    @IBAction func onJournalPress(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToJournal", sender: nil)
    }
    
    @IBAction func onNotifierPress(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToNotifier", sender: nil)
    }
    
    // Prepare segue depending on whih segue was used
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Segue to newItemView
        if (segue.identifier == "segueToJournal"){
            let destVC = segue.destination as! JournalViewController
        }
    }
    
}
