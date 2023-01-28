import Foundation
import UIKit

final class NavigationController: UINavigationController {

    convenience init(
        rootVC: UIViewController
    ) {
        self.init(rootViewController: rootVC)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.shadowImage = UIImage()
    }
}
