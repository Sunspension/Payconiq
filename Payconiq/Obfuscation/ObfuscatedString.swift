//
//  AbfuscatedString.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 17/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import Foundation

/// The special wrapper for plain text data with encoding algorithm.
/// You can use any algorithm you want to encode plain text,
/// you just need to implement Algorithm protocol.

struct ObfuscatedString {
    
    private let _algorithm: Algorithm
    
    private (set) var obfuscated: String
    
    /// Default initializer.
    /// - parameter string: The plain data, which will be encoded.
    /// - parameter algorithm: The encoding algorithm using for encoding plain data.
    init(string: String, algorithm: Algorithm = DefaultObfuscator(salt: [UUID().uuidString])) {
        
        _algorithm = algorithm
        obfuscated = algorithm.encode(string: string)
    }
    
    /// Obtaining the decoded original text data.
    /// - parameter lifeTime: The specific time for living of decoded data.
    /// - Returns: The special wrapper for original data, with self-destruct mechanism.
    func original(lifeTime: TimeInterval) -> DestroyableString {
        
        let original = _algorithm.decode(string: obfuscated)
        return DestroyableString(string: original, time: lifeTime)
    }
}
