//
//  NotifierViewController.swift
//  CovidCompanion
//
//  Created by BYNC on 8/6/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import UIKit
import ContactsUI
import MessageUI

class NotifierViewController: UIViewController,CNContactPickerDelegate, UITableViewDataSource, UITableViewDelegate, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberHolder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = nameHolder[indexPath.row]
        cell.detailTextLabel?.text = numberHolder[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
    

    var numberHolder:[String] = []
    var nameHolder:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func onChooseContact(_ sender: UIButton) {
        let contacVC = CNContactPickerViewController()
        contacVC.delegate = self
        self.present(contacVC, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            var numberToAdd = (((contact.phoneNumbers.first)?.value)?.stringValue ?? "")
            //print (contact)
            //print(numberToAdd)
            //print(contact.givenName)
            
            numberHolder.append(numberToAdd)
            nameHolder.append(contact.givenName)
            insertNewRow()
        }
        
    }
    
    // Method to Insert New Row
    func insertNewRow(){
        // Add new cell to tableView
        let indexPath = IndexPath(row: nameHolder.count-1, section:0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        view.endEditing(true)
    }

    @IBAction func onSendNotification(_ sender: UIButton) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self

        // Configure the fields of the interface.
        composeVC.recipients = numberHolder
        composeVC.body = "CovidCompanion Text PlaceHolder"

        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        }
    }
    
}
