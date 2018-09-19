//
//  ObfuscationExampleViewController.swift
//  Payconiq
//
//  Created by Vladimir Kokhanevich on 18/09/2018.
//  Copyright © 2018 Vladimir Kokhanevich. All rights reserved.
//

import UIKit

class ObfuscationExampleViewController: UIViewController {
    
    private var _obfuscated: ObfuscatedString?
    
    private var _decoded: DestroyableString?
    
    @IBOutlet private weak var plainData: UITextField!
 
    @IBOutlet private weak var lifeTime: UITextField!
    
    @IBOutlet private weak var encoded: UILabel!
    
    @IBOutlet private weak var timer: UILabel!
    
    @IBOutlet private weak var original: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        plainData.becomeFirstResponder()
    }
    
    private func setupTextFields() {
        
        plainData.delegate = self
        lifeTime.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    @IBAction func originalAction(_ sender: Any) {
    
        view.endEditing(true)
        
        if plainData.text!.isEmpty {
            
            showOkAlert(title: "Nothing to encode", message: "Enter your secret data for encoding")
            return
        }
        
        if lifeTime.text!.isEmpty {
            
            showOkAlert(title: "Time is empty", message: "Enter life time for decoded data")
            return
        }
        
        let time = Double(lifeTime.text!)!
        timer.text = String(Int(time))
        
        _decoded = _obfuscated!.original(lifeTime: time)
        _decoded!.onTimeLeft = { time in self.timer.text = String(Int(time)) }
        _decoded!.onDestroy = { self.original.text = "Destroyed" }
        
        original.text = _decoded!.value
    }
    
    private func encode(string: String) {
        
        _obfuscated = ObfuscatedString(string: string)
        encoded.text = _obfuscated?.obfuscated
    }
}

extension ObfuscationExampleViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == plainData {
            
            textValidatorForPlainData(textField, range, string)
            return true
        }
        
        return textValidatorForLifeTime(string: string)
    }
    
    private func textValidatorForPlainData(_ textField: UITextField, _ range: NSRange, _ string: String) {
        
        let text = textField.text!
        let range = Range(range, in: text)!
        
        let substring = text.replacingCharacters(in: range, with: string)
        if substring.isEmpty { encoded.text = "Empty..." }
        else { encode(string: substring) }
    }
    
    private func textValidatorForLifeTime(string: String) -> Bool {
        
        let decimals = CharacterSet.decimalDigits
        let set = CharacterSet(charactersIn: string)
        
        return decimals.isSuperset(of: set)
    }
}
