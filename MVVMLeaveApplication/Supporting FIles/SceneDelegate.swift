 
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var coordinator: AppCoordinator?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let win = UIWindow(windowScene: scene)
        coordinator = AppCoordinator(win)
        coordinator?.initiateNavigation()
    }
 
}

