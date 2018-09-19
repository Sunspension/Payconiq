//
//  Algorithm.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 17/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import Foundation

/// The protocol describes methods of obfuscation.
protocol Algorithm {
    
    /// Method for encode string.
    /// - parameter string: The string for encoding.
    /// - Returns: The encoded string.
    func encode(string: String) -> String
    
    /// Method for decode string.
    /// - parameter string: The string for decoding.
    /// - Returns: The decoded string.
    func decode(string: String) -> String
}
