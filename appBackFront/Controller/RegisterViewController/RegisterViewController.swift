//
//  RegisterViewController.swift
//  appBackFront
//
//  Created by Celio Ferreira on 16/02/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        
    }
    


}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        
        let name: String = registerScreen?.nameTextField.text ?? ""
        let endereco: String = registerScreen?.enderecoTextField.text ?? ""
        let telefone: String = registerScreen?.telefoneTextField.text ?? ""
        let aniversario: String = registerScreen?.aniversarioTextField.text ?? ""
        
        if !name.isEmpty && !endereco.isEmpty && !telefone.isEmpty && !aniversario.isEmpty {
            registerScreen?.registerButton.isEnabled = true
            registerScreen?.registerButton.backgroundColor = .blue
            print("Ativar botao")
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("#function")
        textField.resignFirstResponder()
        
        
        return true
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func tappedRegisterButton() {
        print("Botao clicado View Controller")
        self.navigationController?.popViewController(animated: true)
    }
}
