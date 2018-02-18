//
//  Goals.swift
//  GoalPost
//
//  Created by Hozaifa on 2/9/18.
//  Copyright © 2018 Hozaifa. All rights reserved.
//

import UIKit
import CoreData
class GoalsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObject()
        tableView.reloadData()
    }


    func fetchCoreDataObject() {
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                }else {
                    tableView.isHidden = true
                }
            }
        }
    }
    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        
        guard let createGoalVC  = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}
        presentDetail(createGoalVC)
        
    }
    


}

extension GoalsVC : UITableViewDelegate , UITableViewDataSource {
    
    func setProgress(atIndexPath indexPath: IndexPath) {
        guard let managedContex = appDelegate?.persistentContainer.viewContext else {return}
        
        let chossenGoal = goals[indexPath.row]
        
        if chossenGoal.goalProgress < chossenGoal.goalComptionValue {
            chossenGoal.goalProgress = chossenGoal.goalProgress + 1
            
        }else {
            return
        }
        
        do {
            try managedContex.save()
            print("Sucessfully set progress!")
        }catch {
            print("Could Not set progrss: \(error.localizedDescription)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return goals.count
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        guard let managedContex = appDelegate?.persistentContainer.viewContext else{return}
        managedContex.delete(goals[indexPath.row])
        do {
            try managedContex.save()
            print("Sucessfully Removed")
        }catch {
            print("Saving Error While Deleting: \(error.localizedDescription)")
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell()}
        
        let goal = goals[indexPath.row]
        
        
        cell.Configure(goal: goal)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObject()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        var addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
        addAction.backgroundColor = #colorLiteral(red: 0.9385011792, green: 0.7164435983, blue: 0.3331357837, alpha: 0.7876444777)
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        return [deleteAction,addAction]
    }
    
    
    
}




extension GoalsVC {
    
    func fetch(complition: (_ complete: Bool) -> ()) {
        
        guard let managedContex = appDelegate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            print("Sucess Feath")
            goals = try managedContex.fetch(fetchRequest) 
            
        }
        catch {
            print("The Fetch Did not Work")
            
        }
        
        
    }
    
}









