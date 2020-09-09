//
//  journalDescriptionViewController.swift
//  CovidCompanion
//
//  Created by BYNC on 8/10/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import UIKit

class journalDescriptionViewController: UIViewController {
    var caughtItem:JournalEntry!

    @IBOutlet weak var dateAnswer: UILabel!
    
    @IBOutlet weak var symptomAnswer: UILabel!
    
    @IBOutlet weak var painAnswer: UIImageView!
    
    @IBOutlet weak var travelAnswer: UILabel!
    @IBOutlet weak var travelDetailAnswer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateAnswer.text = caughtItem.Date ?? ""
        symptomAnswer.text = caughtItem.Symptoms ?? ""
        //painAnswer.text = String(caughtItem.PainRating)
        determinePainPicture()
        
        var ex:String!
        if(caughtItem.didLeaveHome){
            ex = "Yes"
        }
        else{
            ex = "No"
        }
        travelAnswer.text = ex ?? ""
        travelDetailAnswer.text = caughtItem.description ?? ""
    }
    
    func determinePainPicture(){
        let pain1 = UIImage(named:"smile1")
        let pain2 = UIImage(named:"smile2")
        let pain3 = UIImage(named:"smile3")
        let pain4 = UIImage(named:"smile4")
        let pain5 = UIImage(named:"smile5")
        let pain6 = UIImage(named:"smile6")
        
        switch caughtItem.PainRating{
        case 1:
            painAnswer.image = pain1
        case 2:
            painAnswer.image = pain2
        case 3:
            painAnswer.image = pain3
        case 4:
            painAnswer.image = pain4
        case 5:
            painAnswer.image = pain5
        case 6:
            painAnswer.image = pain6
        default:
            print("determinePainPicture() switch statement")
        }
    }
    

}
