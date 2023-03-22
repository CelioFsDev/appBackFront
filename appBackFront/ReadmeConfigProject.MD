<Primeiro passo>
    1- Apos criar um novo projeto entre no arquivo SceneDelegate e garanta que ele esteja dessa forma
    
        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let vc: LoginVc = LoginVc()
        let navVC = UINavigationController(rootViewController: vc)//root e nosa primeira tela
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        self.window = window
    } 
<Essa parte é essencial para que o aplicativo apareça tela pois ela que subistituira o storybord>

<Segundo passo, Deletar todo arquivo storybord do projeto.>
    Onde estiver vinculado a main significa que esta vinculado ao storybord entao como vai ser criado todo em view code tem que desvincular. 
Deletar do info.plist onde tem main, e deletar do projeto

<Terceiro passo, criar os grupos de Controller e Screens que serão as Views>
    Por exemplo Controller tera a LoginViewController onde tera a logica por tras da tela
    Por exemplo Screen tera a LoginViewScreen onde tera a criação da tela, com botoes textos textField etc.
