//
//  ViewController.swift
//  appBackFront
//
//  Created by Celio Ferreira on 15/02/23.
//

import UIKit



class LoginVc: UIViewController {
    
    var loginScreen: LoginScreen?
    
    
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.textFieldDelegate(delegate: self)
        self.loginScreen?.delegate(delegate: self)
    }
    
    func habilitarBotaoLogin(){
        let mail: String = loginScreen?.emailTextField.text ?? ""
        var password: String = loginScreen?.passwordTextField.text ?? ""

        if !mail.isEmpty && !password.isEmpty {
            print("Botao habilitado")
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .purple.withAlphaComponent(1)
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
        }

    }


}

extension LoginVc: UITextFieldDelegate {
    private func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
    }
    private func textViewDidEndEditing(_ textView: UITextView){
        print(#function)
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        habilitarBotaoLogin()
        resignFirstResponder()
        return false
    }
}

extension LoginVc: LoginScreenProtocol {
    func tappedLoginButton() {
        print("Clicou no botao logar")
    }
    func tappedRecoverPasswordButton() {
        print("Clicou no botao recover")
        let vcRecoverPassword = RecoverPasswordViewController()
        self.navigationController?.pushViewController(vcRecoverPassword, animated: true)
    }
    func tappedRegisterButton() {
        print("Register button clicado")
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
