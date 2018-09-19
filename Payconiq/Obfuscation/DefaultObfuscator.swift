//
//  Obfuscatable.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 17/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import Foundation

/// The specific class implements Algorithm protocol. Use by default.
class DefaultObfuscator {
    
    private let _obfuscator: Obfuscator
    
    /// Default initializer.
    init(salt: [Any]) {
        
        _obfuscator = Obfuscator(withSalt: salt)
    }
}

extension DefaultObfuscator: Algorithm {
    
    /// Method for encode string.
    /// - parameter string: The string for encoding.
    /// - Returns: The encoded string.
    func encode(string: String) -> String {
        
        let data = _obfuscator.bytesByObfuscatingString(string: string)
        return Data(bytes: data).base64EncodedString()
    }
    
    /// Method for decode string.
    /// - parameter string: The string for decoding.
    /// - Returns: The decoded string.
    func decode(string: String) -> String {
        
        let data = Data(base64Encoded: string.data(using: String.Encoding.utf8)!)!
        return _obfuscator.reveal(key: [UInt8](data))
    }
}
