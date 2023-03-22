//
//  RecoverPassword.swift
//  appBackFront
//
//  Created by Celio Ferreira on 17/02/23.
//

import UIKit

protocol RecoverPasswordScreenProtocol: AnyObject {
    func tappedRecoverPasswordButton()
}

class RecoverPasswordScreen: UIView {
    
    weak var delegate: (RecoverPasswordScreenProtocol)?
    
    public func delegate(delegate: RecoverPasswordScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var titleTextLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Recuperar senha"
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    lazy var emailRecoverTextField: UITextField = {
       let txf = UITextField()
        txf.placeholder = " E-mail"
        txf.textColor = .black
        txf.font = UIFont.systemFont(ofSize: 16)
        txf.translatesAutoresizingMaskIntoConstraints = false
        txf.backgroundColor = .gray.withAlphaComponent(0.3)
        txf.clipsToBounds = true
        txf.layer.cornerRadius = 7
        
        
        return txf
    }()
    lazy var recoverpasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7
        button.setTitle("Recuperar senha", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.isEnabled = false
        button.backgroundColor = .blue.withAlphaComponent(0.5)
        button.addTarget(self, action: #selector(tappedRecoverPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var resultRecoverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail de recuperacao"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        
        
        return label
    }()
    
    @objc func tappedRecoverPasswordButton(_ sender: UIButton){
        delegate?.tappedRecoverPasswordButton()
    }
    
    func textFieldDelegate(delegate: UITextFieldDelegate){
        self.emailRecoverTextField.delegate = delegate
    }
    private func configBackGroud(){
        self.backgroundColor = .white
    }
    
    func configSuperView(){
        addSubview(titleTextLabel)
        addSubview(emailRecoverTextField)
        addSubview(recoverpasswordButton)
        addSubview(resultRecoverLabel)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.titleTextLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.titleTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.emailRecoverTextField.topAnchor.constraint(equalTo: titleTextLabel.topAnchor, constant: 30),
            self.emailRecoverTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.emailRecoverTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.emailRecoverTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.recoverpasswordButton.topAnchor.constraint(equalTo: emailRecoverTextField.topAnchor, constant: 50),
            self.recoverpasswordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.recoverpasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            self.recoverpasswordButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.resultRecoverLabel.topAnchor.constraint(equalTo: recoverpasswordButton.topAnchor, constant: 50),
            self.resultRecoverLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.resultRecoverLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.resultRecoverLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        configConstraints()
        configBackGroud()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
