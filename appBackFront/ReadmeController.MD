<Primeiro depois de ja criado a ControllerScreen>

class LoginVc: UIViewController {
    var loginScreen: LoginScreen?

    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    
    }
}

[Sera criado entao o loadView, o viewDidLoad ja existe no app quando a viewController é criada, com isso estancia a classe para chamar ela na controller da forma descrita acima]
**O método loadView() é chamado quando a visão do controlador de exibição é carregada pela primeira vez. Neste caso, o método loadView() é utilizado para configurar a visualização do controlador de exibição.**

<Logo depois de ter criado o protocolo na screen vai entrar aqui e chamar o protocolo dentro da viewDidLoad()>

        homeScreen?.delegate(delegate: self)
        
[Quando colocar assim na classe vai dar um erro falando que nao esta de acordo, com isso voce vai criar uma extension para fazer funcionar]

extension HomeViewController: HomeScreenProtocol {
    func tappedChooseButton() {
        <#code#>
    }
}
[Ficando entao assim a extenssion com o protocolo chamando a função dos botoes]
