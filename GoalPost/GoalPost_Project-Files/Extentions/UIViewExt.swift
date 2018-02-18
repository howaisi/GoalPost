//
//  UIViewExt.swift
//  GoalPost
//
//  Created by Hozaifa on 2/11/18.
//  Copyright © 2018 Hozaifa. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyboord() {
        NotificationCenter.default.addObserver(self, selector: #selector(keybordWillChnaged(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keybordWillChnaged(_ notification: NSNotification)  {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let animationCurve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! uint
        let startFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey]as! NSValue).cgRectValue
        let endFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey]as! NSValue).cgRectValue
        let deltaY = endFrame.origin.y - startFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: UInt(animationCurve)), animations: {
            self.frame.origin.y += deltaY
            
        }, completion: nil)
    }
    
    
    
    
    
}
