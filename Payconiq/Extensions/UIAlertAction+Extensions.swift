//
//  UIAlertAction+Extensions.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 17/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import UIKit

extension UIAlertAction {
    
    /// The ok button with cancel style without handler.
    class var ok: UIAlertAction {
        
        return UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    }
    
    /// The cancel button without handler.
    class var cancel: UIAlertAction {
        
        return UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    }
    
    /// The cancel action with handler.
    /// - parameter title: The alert title.
    /// - parameter handler: The action handler.
    /// - Returns: The instance of UIAlertAction.
    class func cancelAction(title: String, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        
        return UIAlertAction(title: title, style: .cancel, handler: handler)
    }
    
    /// The default style action button.
    /// - parameter title: The alert title.
    /// - parameter handler: The action handler.
    /// - Returns: The instance of UIAlertAction.
    class func defaultAction(title: String, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        
        return UIAlertAction(title: title, style: .default, handler: handler)
    }
    
    /// The destructive style action button.
    /// - parameter title: The alert title.
    /// - parameter handler: The action handler.
    /// - Returns: The instance of UIAlertAction.
    class func destructiveAction(title: String, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        
        return UIAlertAction(title: title, style: .destructive, handler: handler)
    }
}
