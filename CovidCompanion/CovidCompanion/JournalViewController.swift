//
//  JournalViewController.swift
//  CovidCompanion
//
//  Created by BYNC on 8/6/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var journalEntries:[JournalEntry] = []
    var colorEntries:[UIColor] = []
    var caughtEntry:JournalEntry!
    
    // Keep track of what cell we're referring to
    var count:Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print(journalEntries[indexPath.row].Date)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = journalEntries[indexPath.row].Date
        cell.backgroundColor = colorEntries[indexPath.row]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add sitting journal entry
        let item = JournalEntry(caughtDate: "August 10, 2020", caughtSymptoms: "Had a slight fever, and chronic headache all day", caughtPainRating: 3, caughtDidLeaveHome: true, caughtDesc: "I went to the store, and my friend Ana's house")
        journalEntries.append(item)
        addColor(passedRating: item.PainRating)

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    

    @IBAction func onBeginPress(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToJournalEntry", sender: nil)
    }
    
    @IBAction func unwindToJournal(segue: UIStoryboardSegue)  {
        // Creating item from variables that are filled from newItemView
        let item = caughtEntry!

        // Add object to object array
        journalEntries.append(item)
        addColor(passedRating: item.PainRating)
         
        // Method to add new cell
        insertNewRow()
        
    }
    
    func addColor( passedRating: Int){
        switch passedRating {
        case 1:
            colorEntries.append(UIColor.green)
        case 2:
            colorEntries.append(UIColor.green)
        case 3:
            colorEntries.append(UIColor.yellow)
        case 4:
            colorEntries.append(UIColor.orange)
        case 5:
            colorEntries.append(UIColor.orange)
        case 6:
            colorEntries.append(UIColor.red)
        case -1:
            colorEntries.append(UIColor.white)
        default:
            print("AddColor() switch statement")
        }
    }
    
    // Method to Insert New Row
    func insertNewRow(){
        
        // Add new cell to tableView
        let indexPath = IndexPath(row: journalEntries.count-1, section:0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        view.endEditing(true)
    }
    
    // Perform Segue when cell is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        count = indexPath.row
        performSegue(withIdentifier: "segueToJournalDesc", sender: nil)
    }
    
    // Preparing segue behavior for viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if( segue.identifier == "segueToJournalDesc"){
            let destVC = segue.destination as! journalDescriptionViewController

            // Sending item to journal description
            let item = journalEntries[count]
            destVC.caughtItem = item
            
        }
        
    }
    

}
