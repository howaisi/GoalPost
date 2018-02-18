//
//  UIViewControllerExt.swift
//  GoalPost
//
//  Created by Hozaifa on 2/11/18.
//  Copyright © 2018 Hozaifa. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: nil)
        
    }
    func presentSecounderyDetailed(_ viewController: UIViewController) {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        guard let presentedVC = presentedViewController else {return}
        presentedVC.dismiss(animated: true) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewController, animated: false, completion: nil)
        }
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
