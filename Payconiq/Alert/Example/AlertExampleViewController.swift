//
//  ViewController.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 17/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import UIKit

class AlertExampleViewController: UIViewController {
    
    func showResult(message: String) {
        
        showOkAlert(message: message)
    }
    
    @IBAction func alertAction(_ sender: Any) {
    
        presentAletController(.alert)
    }
    
    @IBAction func actionsSheetAction(_ sender: Any) {
        
        presentAletController(.actionSheet)
    }
    
    private func presentAletController(_ style: UIAlertController.Style) {
        
        let cancel = UIAlertAction.cancelAction(title: "Cancel") { action in
            
            self.showResult(message: "You pressed: " + action.title!)
        }
        
        let okAction = UIAlertAction.defaultAction(title: "Ok") { action in
            
            self.showResult(message: "You pressed: " + action.title!)
        }
        
        AlertPresenter.showAlert(from: self,
                                 preferredStyle: style,
                                 title: "Attention",
                                 message: "Press a button",
                                 actions: [cancel, okAction])
    }
}

