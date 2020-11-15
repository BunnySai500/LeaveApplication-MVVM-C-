 

import Foundation
import UIKit

class AppCoordinator {
    private var window: UIWindow
    init(_ window: UIWindow) {
        self.window = window
    }
    func initiateNavigation()
    {
    let vc = LeaveApplyForm()
    let nav = UINavigationController(rootViewController: vc)
    window.rootViewController = nav
    window.makeKeyAndVisible()
    }
}
