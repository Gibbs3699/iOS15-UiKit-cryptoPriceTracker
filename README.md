# iOS15-UiKit-cryptoPriceTracker

Create a crypto price tracker application using UiKit and iOS15.

# Auto Layout
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

### Auto Layout

# Technical
### Map
<img width="793" alt="Screen Shot 2565-07-14 at 15 30 23" src="https://user-images.githubusercontent.com/57714919/178938512-97ef8949-282e-4306-8014-0b2ead914a97.png">
Convert String to Int always return Optional
<img width="602" alt="Screen Shot 2565-07-14 at 15 30 53" src="https://user-images.githubusercontent.com/57714919/178938605-f7b9bcb9-7607-4609-930f-a9a25c8d8b83.png">
Compactmap reduce Optional and nil value
<img width="549" alt="Screen Shot 2565-07-14 at 15 31 25" src="https://user-images.githubusercontent.com/57714919/178938730-788dd4f4-69d2-4844-99a0-78df4d6dfe0b.png">
<img width="565" alt="Screen Shot 2565-07-14 at 15 31 39" src="https://user-images.githubusercontent.com/57714919/178938787-de9d6e9d-0cb6-4036-a1a3-9c85772724d2.png">
Flatmap reduce extra Optional 

#
### Font
##### Weight
![image](https://user-images.githubusercontent.com/57714919/178930057-afaba677-9487-422e-bc75-ede65eafd0d1.png)

##### Scaling custom font
![image](https://user-images.githubusercontent.com/57714919/178931030-2f4533a3-7e5a-4143-a8d7-5e40b448853d.png)

