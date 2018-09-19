//
//  AES128Obfuscator.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 18/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import Foundation

class AES128Obfuscator {
    
    private let _salt:String
    
    
    init(salt: String = UUID().uuidString) {
        
        _salt = salt
    }
}

extension AES128Obfuscator: Algorithm {
    
    func encode(string: String) -> String {
        
        return string.aesEncryptWithKey(_salt)
    }
    
    func decode(string: String) -> String {
        
        return string.aesDecryptWithKey(_salt)
    }
}
