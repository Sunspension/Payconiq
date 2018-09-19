//
//  PayconiqUITests.swift
//  PayconiqUITests
//
//  Created by Vladimir Kokhanevich on 17/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import XCTest

class PayconiqUITests: XCTestCase {
    
    private let _app = XCUIApplication()
    
    private let _alertButtonTitle = "Present alert"
    
    private let _actionSheetTitle = "Present action sheet"
    
    private let _title = "Attention"
    
    private let _message = "Press a button"
    
    private let _ok = "Ok"
    
    private let _cancel = "Cancel"
    
    private let _pressedOk = "You pressed: Ok"
    
    private let _pressedCancel = "You pressed: Cancel"
    
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testDisplayingAlert() {
        
        _app.buttons[_alertButtonTitle].tap()
        XCTAssertNotNil(_app.alerts)
    }
    
    func testAlertPressedOkButton() {
        
        _app.buttons[_alertButtonTitle].tap()
        
        let alert = _app.alerts
        XCTAssertNotNil(alert)
        
        // title
        XCTAssert(alert.element.staticTexts[_title].exists)
        
        // message
        XCTAssert(alert.element.staticTexts[_message].exists)
        
        alert.buttons[_ok].tap()
        XCTAssert(_app.alerts.staticTexts[_pressedOk].exists)
    }
    
    func testAlertPressedCancelButton() {
        
        _app.buttons[_alertButtonTitle].tap()
        
        let alert = _app.alerts
        XCTAssertNotNil(alert)
        
        // title
        XCTAssert(alert.element.staticTexts[_title].exists)
        
        // message
        XCTAssert(alert.element.staticTexts[_message].exists)
        
        alert.buttons[_cancel].tap()
        XCTAssert(_app.alerts.staticTexts[_pressedCancel].exists)
    }
    
    func testDisplayingActionSheet() {
        
        _app.buttons[_actionSheetTitle].tap()
        XCTAssertNotNil(_app.alerts)
    }
    
    func testActionSheetPressedOkButton() {
        
        _app.buttons[_actionSheetTitle].tap()
        
        let sheet = _app.sheets
        XCTAssertNotNil(sheet)
        
        // title
        XCTAssert(sheet.element.staticTexts[_title].exists)
        
        // message
        XCTAssert(sheet.element.staticTexts[_message].exists)
        
        sheet.buttons[_ok].tap()
        XCTAssert(_app.alerts.staticTexts[_pressedOk].exists)
    }
    
    func testActionSheetPressedCancelButton() {
        
        _app.buttons[_actionSheetTitle].tap()
        
        let sheet = _app.sheets
        XCTAssertNotNil(sheet)
        
        // title
        XCTAssert(sheet.element.staticTexts[_title].exists)
        
        // message
        XCTAssert(sheet.element.staticTexts[_message].exists)
        
        sheet.buttons[_cancel].tap()
        XCTAssert(_app.alerts.staticTexts[_pressedCancel].exists)
    }
}
