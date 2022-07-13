# iOS15-UiKit-cryptoPriceTracker

Create a crypto price tracker application using UiKit and iOS15.

#
### No storyboard
##### Under iOS13 (AppDelegate)

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let VC = ViewController()
        window?.rootViewController = VC
        window?.makeKeyAndVisible()  // create app without storyboard
        
        return true
    }

##### iOS13 and Above (SceneDelegate)

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScence = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScence.coordinateSpace.bounds)
        window?.windowScene = windowScence
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible() // create app without storyboard
    }
