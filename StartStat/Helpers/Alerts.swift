//
//  Alerts.swift
//  StartStat
//
//  Created by John Nik on 1/20/18.
//  Copyright © 2018 johnik703. All rights reserved.
//

import Foundation
import UIKit
import JHTAlertController

typealias AlertActionHandler = (UIAlertAction)->()
typealias AlertPresentCompletion = ()->()

//MARK: handle jhtalertaction

typealias JHTAlertActionHandler = ((JHTAlertAction) -> Void)!
extension UIViewController {
    
    func showJHTAlerttOkayWithIcon(message: String) {
        
        let alertController = JHTAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.titleImage = UIImage(named: AssetName.alertIcon.rawValue)
        alertController.titleViewBackgroundColor = .white
        alertController.titleTextColor = .black
        alertController.alertBackgroundColor = .white
        alertController.messageFont = .systemFont(ofSize: 18)
        alertController.messageTextColor = .black
        alertController.setAllButtonBackgroundColors(to: .white)
        alertController.dividerColor = .black
        alertController.setButtonTextColorFor(.cancel, to: .black)
        alertController.hasRoundedCorners = true
        
        let cancelAction = JHTAlertAction(title: "OK", style: .cancel,  handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func showJHTAlertDefaultWithIcon(message: String, firstActionTitle: String, secondActionTitle: String, action: JHTAlertActionHandler) {
        
        let alertController = JHTAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.titleImage = UIImage(named: "")
        alertController.titleViewBackgroundColor = .white
        alertController.titleTextColor = .black
        alertController.alertBackgroundColor = .white
        alertController.messageFont = .systemFont(ofSize: 18)
        alertController.messageTextColor = .black
        alertController.setAllButtonBackgroundColors(to: .white)
        alertController.dividerColor = .black
        alertController.setButtonTextColorFor(.default, to: StyleGuideManager.mainYellowBackgroundColor)
        alertController.setButtonTextColorFor(.cancel, to: .black)
        alertController.hasRoundedCorners = true
        
        let cancelAction = JHTAlertAction(title: firstActionTitle, style: .cancel,  handler: nil)
        let okAction = JHTAlertAction(title: secondActionTitle, style: .default, handler: action)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func showJHTAlertDefault(title: String, message: String, firstActionTitle: String, secondActionTitle: String, action: JHTAlertActionHandler) {
        
        let alertController = JHTAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.titleViewBackgroundColor = .white
        alertController.titleTextColor = .black
        alertController.alertBackgroundColor = .white
        alertController.messageFont = .systemFont(ofSize: 18)
        alertController.messageTextColor = .black
        alertController.setAllButtonBackgroundColors(to: .white)
        alertController.dividerColor = .black
        alertController.setButtonTextColorFor(.default, to: .red)
        alertController.setButtonTextColorFor(.cancel, to: .black)
        alertController.hasRoundedCorners = true
        
        let cancelAction = JHTAlertAction(title: firstActionTitle, style: .cancel,  handler: nil)
        let okAction = JHTAlertAction(title: secondActionTitle, style: .default, handler: action)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
}
 

//MARK: handle AFMActionSheet
/*
typealias AFMActionHandler = (AFMAction) -> ()

extension UIViewController {
    
    func showAFMActionSheet(firstActionName: String, secondActionName: String, firstAction: @escaping (AFMActionHandler), secondAction: @escaping (AFMActionHandler)) {
        let actionSheet = AFMActionSheetController(style: .actionSheet, transitioningDelegate: AFMActionSheetTransitioningDelegate())
        
        let firstAction = AFMAction(title: firstActionName, enabled: true, handler: firstAction)
        let secondAction = AFMAction(title: secondActionName, enabled: true, handler: secondAction)
        
        let cancelAction = AFMAction(title: "Cancel", handler: nil)
        
        
        
        actionSheet.add(firstAction)
        actionSheet.add(secondAction)
        actionSheet.add(cancelling: cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
}
 */


extension UIViewController {
    
    func showErrorAlert(_ title:String? = nil, message:String, action:(AlertActionHandler)? = nil, completion:AlertPresentCompletion? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: action)
        alert.addAction(okAction)
        present(alert, animated: true, completion: completion)
    }
    
    func showErrorAlertWith(_ title:String, message: String, action:(AlertActionHandler)? = nil, completion:AlertPresentCompletion? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: action)
        alert.addAction(okAction)
        present(alert, animated: true, completion: completion)
    }
    
    func showErrorAlertWithOKCancel(_ title:String? = nil, message:String, action:(AlertActionHandler)? = nil, completion:AlertPresentCompletion? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: action)
//        okAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
//        cancelAction.setValue(UIColor.black, forKey: "titleTextColor")
        alert.addAction(cancelAction)
        
        
        
        present(alert, animated: true, completion: completion)
        alert.view.tintColor = UIColor.green
    }
    
    func showErrorAlertWithAgree(_ title:String? = nil, message:String, action:(AlertActionHandler)? = nil, disagreeAction:(AlertActionHandler)? = nil, completion:AlertPresentCompletion? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Agree", style: .default, handler: action)
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Disagree", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        alert.view.frame = UIScreen.main.bounds
        
        okAction.setValue(UIColor.red, forKey: "titleTextColor")
        cancelAction.setValue(UIColor.black, forKey: "titleTextColor")
        
        present(alert, animated: true, completion: completion)
    }
    
    func showActionSheetWith(_ title:String? = nil, message: String, firstActionName: String, secondeActionName: String, firstAction:(AlertActionHandler)? = nil, secondAction:(AlertActionHandler)? = nil, completion:AlertPresentCompletion? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: firstActionName, style: .default, handler: firstAction)
        let cameraAction = UIAlertAction(title: secondeActionName, style: .default, handler: secondAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(galleryAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: completion)
    }
}

typealias OkHandler = (_ thingAmount: String) -> Void

func showAlertMessageWhenLending(vc: UIViewController, titleStr: String, messageStr: String) -> Void {
    
    let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: .alert)
    
    let OkAction = UIAlertAction(title: "Ok!", style: .default) { (action) in
        let textField = alert.textFields![0]
        print(textField.text!)
    }
    
    let cancel = UIAlertAction(title: "cancel", style: .destructive, handler: nil)
    
    alert.addTextField { (textField: UITextField) in
        
        textField.keyboardAppearance = .dark
        textField.keyboardType = .default
        textField.autocorrectionType = .default
        textField.placeholder = "Type amount"
        textField.clearButtonMode = .whileEditing
        
    }
    
    alert.addAction(OkAction)
    alert.addAction(cancel)
    
    vc.present(alert, animated: true, completion: nil)
    
}

func fadeViewInThenOut(view : UIView, delay: TimeInterval) {
    
    let animationDuration = 0.25
    
    // Fade in the view
    UIView.animate(withDuration: animationDuration, animations: { () -> Void in
        view.alpha = 1
    }) { (Bool) -> Void in
        
        // After the animation completes, fade out the view after a delay
        
        UIView.animate(withDuration: animationDuration, delay: delay, options: .curveEaseInOut, animations: { () -> Void in
            view.alpha = 0
        },
                       completion: nil)
    }
}

