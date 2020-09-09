//
//  JournalEntryViewController.swift
//  CovidCompanion
//
//  Created by BYNC on 8/6/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import UIKit

class JournalEntryViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var symptomTextField: UITextView!
    @IBOutlet weak var travelTextField: UITextView!
    @IBOutlet weak var travelChoice: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var didTravel:Bool!
    var painRating:Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        didTravel = false
        painRating = -1;
        
      
        symptomTextField.delegate = self
        travelTextField.delegate = self
        
        // Do any additional setup after loading the view.
        symptomTextField.text = "Please enter symptoms here..."
        symptomTextField.textColor = UIColor.lightGray
        
        travelTextField.text = "Please enter details of your travel here..."
        travelTextField.textColor = UIColor.lightGray
        
        //datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
    }
  
    // Preparing segue behavior for viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! JournalViewController
        
        // Extracting information from textfields
        let dateToPass = dateCreater(datePassed: datePicker.date.description)
        let symptomNotesToPass = symptomTextField.text ?? ""
        let painRatingToPass = painRating ?? -1
        let travelAnswer = didTravel ?? false
        let travelNotesToPass = travelTextField.text ?? ""
        
        let entryToPass = JournalEntry(caughtDate: dateToPass, caughtSymptoms: symptomNotesToPass, caughtPainRating: painRatingToPass, caughtDidLeaveHome: travelAnswer, caughtDesc: travelNotesToPass)
        
        // Attaching data to unrolled segue
        destVC.caughtEntry = entryToPass
        
    }
    
    func dateCreater(datePassed: String) -> String{
        var phase = 1
        
        var month:String = ""
        var day:String = ""
        var year:String = ""
        
        var result = ""
        
        for char in datePassed {
            if(char == "-"){
                phase += 1
                continue
            }
            if(char == " "){
                break
            }
            
            //print(char)
            
            
            switch phase {
            case 1:
                year = year + String(char)
            case 2:
                month = month + String(char)
            case 3:
                day = day + String(char)
            default:
                print("dateCreator() switch")
            }
        }
        
        month = monthName(monthPassed: month)
        print("\(month),\(day) \(year)")
        result = "\(month) \(day), \(year)"
        
        
        return result
    }
    
    func monthName(monthPassed:String)->String{
        var month = ""
        
        switch monthPassed {
        case "01":
            month = "January"
        case "02":
            month = "February"
        case "03":
            month = "March"
        case "04":
            month = "April"
        case "05":
            month = "May"
        case "06":
            month = "June"
        case "07":
            month = "July"
        case "08":
            month = "August"
        case "09":
            month = "September"
        case "10":
            month = "October"
        case "11":
            month = "November"
        case "12":
            month = "December"
        default:
            print("monthName() switch")
        }
        
        return month
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray{
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
 
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "Please enter symptoms here..."
            textView.textColor = UIColor.lightGray
        }
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            didTravel = false
            //print("Didtravel false")
        }
        else if sender.selectedSegmentIndex == 1{
            //print("Did travel true")
            didTravel = true
        }
    }
    
    @IBAction func onSubmitPress(_ sender: UIButton) {
        // Compile package to send back
        //print("Pressed!")
    }
    
    @IBAction func onSmile1(_ sender: UIButton) {
        painRating = 1
    }
    
    @IBAction func onSmile2(_ sender: UIButton) {
        painRating = 2
    }
    
    @IBAction func onSmile3(_ sender: UIButton) {
        painRating = 3
    }
    
    @IBAction func onSmile4(_ sender: UIButton) {
        painRating = 4
    }
    
    @IBAction func onSmile5(_ sender: UIButton) {
        painRating = 5
    }
    
    @IBAction func onSmile6(_ sender: UIButton) {
        painRating = 6
    }
    
}
