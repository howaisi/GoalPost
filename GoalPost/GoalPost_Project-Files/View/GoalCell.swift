//
//  GoalCell.swift
//  GoalPost
//
//  Created by Hozaifa on 2/10/18.
//  Copyright © 2018 Hozaifa. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    //Makr: Outlets
    @IBOutlet weak var complitionView: UIView!
    @IBOutlet weak var goalDiscription: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    //: ------------------------------------------
    
    func Configure(goal: Goal) {
        
        self.goalDiscription.text = goal.goalDiscription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalComptionValue {
            self.complitionView.isHidden = false
        }else {
            self.complitionView.isHidden = true
        }
    }
    
}
