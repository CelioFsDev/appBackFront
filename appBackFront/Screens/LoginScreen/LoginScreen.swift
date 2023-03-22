//
//  LoginScreen.swift
//  appBackFront
//
//  Created by Celio Ferreira on 15/02/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedRecoverPasswordButton()
    func tappedRegisterButton()
}


class LoginScreen: UIView {
    
    weak var delegate: (LoginScreenProtocol)?
    
    public func delegate(delegate: LoginScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BGLogin")
        
        return image
    }()
    
    lazy var logoAppImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BFLogin")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var titleAppLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BF NFT"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O Marketplace de NFTs da Back Front Academy"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let txf = UITextField()
        txf.translatesAutoresizingMaskIntoConstraints = false
        //txf.placeholder = "Digite seu email"
        txf.font = UIFont.systemFont(ofSize: 20)
        txf.keyboardType = .emailAddress
        txf.textColor = .white
        txf.attributedPlaceholder = NSAttributedString(string: "Digite seu email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        txf.backgroundColor = .darkGray.withAlphaComponent(0.3)
        txf.borderStyle = .roundedRect
        txf.layer.cornerRadius = 12
        txf.autocorrectionType = .no
        txf.layer.borderWidth = 1.0
        txf.layer.borderColor = UIColor.white.cgColor
        
        return txf
    }()
    
    lazy var passwordTextField: UITextField = {
        let txf = UITextField()
        txf.translatesAutoresizingMaskIntoConstraints = false
        txf.attributedPlaceholder = NSAttributedString(string: "Digite sua senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        txf.backgroundColor = .darkGray.withAlphaComponent(0.3)
        txf.font = UIFont.systemFont(ofSize: 20)
        txf.keyboardType = .default
        txf.textColor = .white
        txf.backgroundColor = .darkGray.withAlphaComponent(0.3)
        txf.borderStyle = .roundedRect
        txf.layer.cornerRadius = 12
        txf.layer.borderWidth = 1.0
        txf.layer.borderColor = UIColor.white.cgColor
        txf.autocorrectionType = .no
        txf.isSecureTextEntry = true
        return txf
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        button.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.addTarget(self, action: #selector(tappedRecoverPasswordButton), for: .touchUpInside)
        
        return button
    }()
    
//    lazy var loginButtonImageView: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "gradient3")
//        image.clipsToBounds = true
//        image.layer.cornerRadius = 0
//        image.contentMode = .scaleToFill
//        return image
//    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.backgroundColor = .purple.withAlphaComponent(0.2)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var lineview: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    
    return view
    
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        button.backgroundColor = .purple.withAlphaComponent(1)
        button.setTitle("Registrar", for: .normal)
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var singInMetamaskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    lazy var singInMetamaskImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var singInMetamaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entrar com a Metamask"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    
    @objc func tappedLoginButton(_ sender: UIButton){
        delegate?.tappedLoginButton()
    }
    @objc func tappedRecoverPasswordButton(_ sender: UIButton){
        delegate?.tappedRecoverPasswordButton()
    }
    @objc func tappedRegisterButton(_ sender: UIButton){
            delegate?.tappedRegisterButton()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGroud()
        self.configSuperView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGroud(){
        self.backgroundColor = .white
    }
    
    
    private func configSuperView(){
        self.addSubview(subImageView)
        self.addSubview(logoAppImageView)
        self.addSubview(titleAppLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(recoverPasswordButton)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
//        self.addSubview(loginButtonImageView)
        self.addSubview(lineview)
        self.addSubview(singInMetamaskView)
        singInMetamaskView.addSubview(singInMetamaskImageView)
        singInMetamaskView.addSubview(singInMetamaskLabel)
    }
    
    public func textFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 160),
            
            self.titleAppLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 10),
            self.titleAppLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleAppLabel.bottomAnchor, constant: 8),
            self.titleAppLabel.centerXAnchor.constraint(equalTo: self.subTitleLabel.centerXAnchor),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor, constant: 10),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            self.recoverPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            self.recoverPasswordButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
//            self.loginButtonImageView.topAnchor.constraint(equalTo: self.recoverPasswordButton.bottomAnchor, constant: 10),
//            self.loginButtonImageView.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.loginButtonImageView.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.loginButtonImageView.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.recoverPasswordButton.bottomAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            self.lineview.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 48),
            self.lineview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            self.lineview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            self.lineview.heightAnchor.constraint(equalToConstant: 0.5),
            
            self.registerButton.topAnchor.constraint(equalTo: self.lineview.bottomAnchor, constant: 30),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            self.singInMetamaskView.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor, constant: 20),
            self.singInMetamaskView.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.singInMetamaskView.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.singInMetamaskView.heightAnchor.constraint(equalToConstant: 41),
            
            self.singInMetamaskImageView.leadingAnchor.constraint(equalTo: singInMetamaskView.leadingAnchor, constant: 50),
            self.singInMetamaskImageView.centerYAnchor.constraint(equalTo: singInMetamaskView.centerYAnchor),
            self.singInMetamaskImageView.heightAnchor.constraint(equalToConstant: 20),
            self.singInMetamaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            self.singInMetamaskLabel.leadingAnchor.constraint(equalTo: singInMetamaskImageView.trailingAnchor, constant: 17),
            self.singInMetamaskLabel.centerYAnchor.constraint(equalTo: singInMetamaskView.centerYAnchor)
            
            
        ])
    }
}
