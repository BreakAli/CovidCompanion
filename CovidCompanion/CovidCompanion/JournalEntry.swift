//
//  JournalEntry.swift
//  CovidCompanion
//
//  Created by BYNC on 8/6/20.
//  Copyright © 2020 AliDarawsha. All rights reserved.
//

import Foundation
class JournalEntry{
    var Date:String!
    var Symptoms:String!
    var PainRating:Int!
    
    var didLeaveHome:Bool!
    var description:String!
    
    init(caughtDate: String, caughtSymptoms:String, caughtPainRating:Int, caughtDidLeaveHome:Bool, caughtDesc:String){
        self.Date = caughtDate
        self.Symptoms = caughtSymptoms
        self.PainRating = caughtPainRating
        
        self.didLeaveHome = caughtDidLeaveHome
        self.description = caughtDesc
    }
}
