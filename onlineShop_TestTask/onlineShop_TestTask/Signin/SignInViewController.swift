//
//  SignInViewController.swift.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 11.03.2023.
//

import UIKit

class SignInViewController: UIViewController {
    private var signInView = SignInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = signInView
        addTargets()
    }

    private func addTargets() {
        signInView.alreadyLoginButton.addTarget(self, action: #selector(goToLogInnViewController), for: .touchUpInside)
    }

    @objc
    private func goToLogInnViewController() {
        let logInnViewController = NavigationController(rootViewController: LogInViewController())
        self.present(logInnViewController, animated: true)
    }
}
