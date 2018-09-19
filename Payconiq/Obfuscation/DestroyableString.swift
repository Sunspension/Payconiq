//
//  DestroyableString.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 17/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import Foundation

/// The specific wrapper for store string data with self-destruct mechanism.
class DestroyableString {
    
    private var timer: Timer?
    
    private (set) var value: String?
    
    var onTimeLeft: ((_ time: TimeInterval) -> Void)?
    
    var onDestroy: (() -> Void)?
    
    /// Default initializer.
    /// - parameter string: The string data.
    /// - parameter time: The specific time for living of string data.
    init(string: String, time: TimeInterval) {
        
        value = string
        destroyValue(after: time)
    }
    
    /// The self-destruct mechanism.
    private func destroyValue(after: TimeInterval) {
        
        var time = after
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [unowned self] timer in
            
            time -= 1
            self.onTimeLeft?(time)
            
            if time == 0 {
                
                self.value = nil
                self.onDestroy?()
                timer.invalidate()
            }
        })
    }
}
