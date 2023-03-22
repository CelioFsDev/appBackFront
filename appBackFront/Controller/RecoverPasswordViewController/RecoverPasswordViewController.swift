//
//  RecoverPasswordViewController.swift
//  appBackFront
//
//  Created by Celio Ferreira on 17/02/23.
//

import UIKit

class RecoverPasswordViewController: UIViewController {
    
    var recoverPasswordScreen: RecoverPasswordScreen?
    
    override func loadView() {
        self.recoverPasswordScreen = RecoverPasswordScreen()
        self.view = recoverPasswordScreen    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recoverPasswordScreen?.textFieldDelegate(delegate: self)
        self.recoverPasswordScreen?.delegate(delegate: self)
    }
    
    func recoverText(){
        let a = recoverPasswordScreen?.emailRecoverTextField.text ?? ""
        
        if a.count > 5 {
            let rec: String = "Email de recuperacao e \(recoverPasswordScreen?.emailRecoverTextField.text ?? "error")"
            recoverPasswordScreen?.resultRecoverLabel.text = rec
        }else {
            recoverPasswordScreen?.resultRecoverLabel.text = "Digite um email correto"
        
        }
    }

}
extension RecoverPasswordViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        let mail: String = recoverPasswordScreen?.emailRecoverTextField.text ?? ""
       
        if !mail.isEmpty {
            recoverPasswordScreen?.recoverpasswordButton.isEnabled = true
            recoverPasswordScreen?.recoverpasswordButton.backgroundColor = .blue
        }
        
        
        return false
    }
}

extension RecoverPasswordViewController: RecoverPasswordScreenProtocol {
    func tappedRecoverPasswordButton() {
        
           recoverText()

       
    }
    
    
}
