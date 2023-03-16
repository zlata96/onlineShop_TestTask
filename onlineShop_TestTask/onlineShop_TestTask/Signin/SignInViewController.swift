// SignInViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

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
        present(logInnViewController, animated: true)
    }
}
