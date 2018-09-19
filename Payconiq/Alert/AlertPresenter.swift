//
//  AlertPresenter.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 17/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import UIKit

class AlertPresenter {
    
    /// Displaying alert in a given view controller
    /// - parameter from: The view controller, which will preset alert controller modaly.
    /// - parameter preferredStyle: The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert.
    /// - parameter title: The alert title.
    /// - parameter message: The alert message.
    /// - parameter actions: The array of action for displaying alert buttons.
    /// - parameter completion: The block to execute after the presentation finishes.
    class func showAlert(from: UIViewController,
                         preferredStyle: UIAlertController.Style = .alert,
                         title: String? = nil,
                         message: String? = nil,
                         actions: [UIAlertAction]? = nil,
                         completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        actions?.forEach({ alert.addAction($0) })
        from.present(alert, animated: true, completion: completion)
    }
}
