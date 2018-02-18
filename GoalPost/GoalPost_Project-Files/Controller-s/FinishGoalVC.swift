//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Hozaifa on 2/12/18.
//  Copyright © 2018 Hozaifa. All rights reserved.
//

import UIKit
import CoreData
let appDelegate = UIApplication.shared.delegate as? AppDelegate

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var pontTxt: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    var goalDiscritption: String!
    var goalType: GoalType!
    override func viewDidLoad() {
        super.viewDidLoad()
        pontTxt.delegate = self
        createGoalBtn.bindToKeyboord()
        
    }

    func initData(description: String, type: GoalType) {
        
        self.goalDiscritption = description
        self.goalType = type
    }

    @IBAction func createGoalBtnPressed(_ sender: UIButton) {
        if pontTxt.text != "" {
            self.save { (complete) in
                if complete == true {
                    performSegue(withIdentifier:"backToMain" , sender: self)
                } else {
                    
                    print("error")
                }
                
            }
        }
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismissDetail()
    }
    
    func save(complition : (_ finished : Bool) -> ()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let goal = Goal(context: managedContext)
        
        goal.goalDiscription = goalDiscritption
        goal.goalType = goalType.rawValue
        goal.goalComptionValue = Int32(pontTxt.text!)!
        goal.goalProgress = Int32(0)
        
        do {
           try managedContext.save()
            complition(true)
            
            print("Done")
        } catch {
            
            debugPrint("Colud Not Save: \(error.localizedDescription)")
            complition(false)
        }
        
        
        
    }
    
    

}











