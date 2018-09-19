//
//  UIViewController+Extensions.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 17/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Displaying alert controller with ok button.
    /// - parameter title: The alert title.
    /// - parameter message: The alert message.
    func showOkAlert(title: String? = nil, message: String? = nil) {
        
        AlertPresenter.showAlert(from: self,
                                 title: title,
                                 message: message,
                                 actions: [UIAlertAction.ok],
                                 completion: nil)
    }
}
