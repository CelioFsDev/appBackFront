Passo a passo de como foi criado appBackFront

    
<PRIMEIRO PASSO, criar dentro da Screen o init frame onde sera armazenado as funções com a criação das ações da tela, botao, backgroud, constraints>
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGroud()
        self.configSuperView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
[Aqui contera todo oque foi criado dentro da tela, tanto o backGround as view, constraints.]
    Esse é o primeiro passo depois da criação da Screen
    
<SEGUNDO PASSO, criar a view em si, como um botao um fundo, uma imagem, um textfield.>
Ex: lazy var emailTextField: UITextField = {
        let txf = UITextField()
        txf.translatesAutoresizingMaskIntoConstraints = false
        txf.placeholder = "Digite seu email"
        txf.font = UIFont.systemFont(ofSize: 20)
        txf.keyboardType = .emailAddress
        txf.textColor = .white
        txf.backgroundColor = .darkGray.withAlphaComponent(0.3)
        txf.borderStyle = .roundedRect
        txf.autocorrectionType = .no
        
        return txf
    }()
[aqui foi criado um textField que sera onde o usuario ira digitar o email dentro da tela de login por exemplo, tem todas as funcionalidades des e nao pode esquecer de colocar translatesAutoresinz para que possa receber as  constraints.]

<TERCEIRO PASSO depois de criado sera adicionar a uma subView>
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
    }
    [Depois que ja criou o init frame que recebe as funções, criou um item na tela, adiciona esse item a uma subview, que essa subview recebera esse item e a funcao da subview ira ser colocada no init frame para que apareça na tela]



<Quarto passo, com a criacao de um Botao na tela ja fazer abaixo dele a funcao de acao do botao> 
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
    
  [  @objc func tappedRegisterButton(_ sender: UIButton){    ] 
  [                                                          ]
  [ }                                                        ]

<Quinto passo criar o setupConstraints para que consiga setar a posicao do item criado>
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 160),
            
            self.titleAppLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 10),
            self.titleAppLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
        ])}

<Sexto Passo, depois de criado já os botoes e colocado a função logo abaixo, como ja descrito acima, vamos criar um protocol que vai receber o nome da função assim

protocol HomeScreenProtocol: AnyObject{
    func tappedRegisterButton()
    
}
[Criando assim o protocol do botao, todos os botoes criados com suas funcoes tem que ter uma funcao no protocol]

<Depois de criar os Protocolos de todos os botoes vamos implementar o delegate na class>
        private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol){
        self.delegate = delegate
    }
    [Deixando assim para implementar, colocar os delegates logo acima dos objetos da tela criado]

<Depois de criado a implementacao vamos ir ao @objc func tappedRegisterButton criado e vamos colocar na funcao o delegate para funcionar>
    @objc func tappedRegisterButton(_ sender: UIButton){    
    delegate?.tappedRegisterButton()                        
   }                                                        

[Ficando assim a funcao com o delegate nela]
