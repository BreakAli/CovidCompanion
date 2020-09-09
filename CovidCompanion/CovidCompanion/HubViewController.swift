//
//  HubViewController.swift
//  CovidCompanion
//
//  Created by BYNC on 8/6/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import UIKit

class HubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func commonSymptoms(_ sender: UIButton) {
        guard let url = URL(string: "https://www.webmd.com/lung/covid-19-symptoms") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func precautions(_ sender: UIButton) {
        guard let url = URL(string: "https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func testingSites(_ sender: UIButton) {
        guard let url = URL(string: "https://www.dph.illinois.gov/testing") else { return }
        UIApplication.shared.open(url)
    }
    

    @IBAction func cdcWebsite(_ sender: UIButton) {
        guard let url = URL(string: "https://www.cdc.gov") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func caseNumber(_ sender: UIButton) {
        guard let url = URL(string: "http://www.dph.illinois.gov/topics-services/diseases-and-conditions/diseases-a-z-list/coronavirus") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func localGuidelines(_ sender: UIButton) {
        guard let url = URL(string: "https://www.chicago.gov/city/en/sites/covid-19/home.html") else { return }
        UIApplication.shared.open(url)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
