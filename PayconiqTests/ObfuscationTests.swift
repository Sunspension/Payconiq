//
//  ObfuscationTests.swift
//  PayconiqTests
//
//  Created by Vladimir Kokhanevich on 18/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import Foundation

import XCTest
@testable import Payconiq

class ObfuscationTests: XCTestCase {
    
    private let _plain = "My top secret data"
    
    private var secret: ObfuscatedString {
        
        return ObfuscatedString(string: _plain)
    }
    
    private var aes128Secret: ObfuscatedString {
        
        return ObfuscatedString(string: _plain, algorithm: AES128Obfuscator())
    }
    
    func testCreationObfuscatedStringWithDefaultAlgorithm() {
        
        let obfuscated = secret.obfuscated
        XCTAssert(_plain != obfuscated)
    }
    
    func testLifeTimeOfDestroyableStringWithDefaultAlgorithm() {
        
        execute(title: "timer counter default") { promise in
            
            let destroyable = secret.original(lifeTime: 2)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                
                let value = destroyable.value
                XCTAssertNotNil(value)
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                
                let value = destroyable.value
                XCTAssertNil(value)
                promise.fulfill()
            }
        }
    }
    
    func testCreationObfuscatedStringWithAES128Algorithm() {
        
        let obfuscated = aes128Secret.obfuscated
        XCTAssert(_plain != obfuscated)
    }
    
    func testLifeTimeOfDestroyableStringWithAES128Algorithm() {
        
        execute(title: "self-destruct-AES") { promise in
            
            let destroyable = aes128Secret.original(lifeTime: 2)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                
                let value = destroyable.value
                XCTAssertNotNil(value)
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                
                let value = destroyable.value
                XCTAssertNil(value)
                promise.fulfill()
            }
        }
    }
    
    func testSelfDestructClosure() {
        
        let promise = expectation(description: "closure")
        
        let time: TimeInterval = 3
        let destroyable = secret.original(lifeTime: time)
        destroyable.onDestroy = { promise.fulfill() }
        
        waitForExpectations(timeout: time + 1, handler: errorHandler(_:))
    }
    
    func testTimerCounter() {
        
        let promise = expectation(description: "timer counter")
        
        let time: TimeInterval = 3
        var result = time
        
        let destroyable = secret.original(lifeTime: time)
        
        destroyable.onTimeLeft = { time in
            
            result -= 1
            XCTAssert(result == time)
        }
        
        destroyable.onDestroy = { promise.fulfill() }
        
        waitForExpectations(timeout: time + 1, handler: errorHandler(_:))
    }
    
    private func execute(title: String, closure: (_ promise: XCTestExpectation) -> Void) {
        
        let promise = expectation(description: title)
        closure(promise)
        waitForExpectations(timeout: 4, handler: errorHandler(_:))
    }
    
    private func errorHandler(_ error: Error?) {
        
        print(error?.localizedDescription ?? "")
    }
}
