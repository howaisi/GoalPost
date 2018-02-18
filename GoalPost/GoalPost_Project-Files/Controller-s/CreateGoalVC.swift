//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by Hozaifa on 2/11/18.
//  Copyright © 2018 Hozaifa. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController , UITextViewDelegate{

    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .ShortTerm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboord()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselctedColor()
        goalTxtView.delegate = self
       
    }
    
    
    @IBAction func longTermBtn(_ sender: UIButton) {
        goalType = .LongTerm
        shortTermBtn.setDeselctedColor()
        longTermBtn.setSelectedColor()
    }
    
    
    @IBAction func shortTermBtnPressed(_ sender: UIButton) {
        goalType = .ShortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselctedColor()
        
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if goalTxtView.text != " " && goalTxtView.text != "What is your Goal ?"{
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else{return}
            
            finishGoalVC.initData(description: goalTxtView.text!, type: goalType)
            presentDetail(finishGoalVC)
        }
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismissDetail()
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTxtView.text = " "
        goalTxtView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    
}
