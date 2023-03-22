// Router.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class Router {
    static let shared = Router()

    func loadInitialScreen() {
        if !isAppAlreadyLaunchedOnce {
            let controller = UINavigationController(rootViewController: SignInViewController())
            setRootViewController(controller: controller)
        } else {
            if isUserSignIn {
                let controller = TabBarController()
                setRootViewController(controller: controller)
            } else {
                let controller = UINavigationController(rootViewController: LogInViewController())
                setRootViewController(controller: controller)
            }
        }
    }

    func setRootViewController(controller: UIViewController, animatedWithOptions: UIView.AnimationOptions? = nil) {
        guard let window = UIApplication.shared.keyWindow else {
            fatalError("No window in app")
        }
        if let animationOptions = animatedWithOptions, window.rootViewController != nil {
            window.rootViewController = controller
            UIView.transition(
                with: window,
                duration: 0.33,
                options: animationOptions,
                animations: {}
            )
        } else {
            window.rootViewController = controller
        }
    }

    private var isUserSignIn: Bool {
        // TODO:
        true
    }

    private var isAppAlreadyLaunchedOnce: Bool {
        true
//        if !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBeforeFlag") {
//            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBeforeFlag")
//            UserDefaults.standard.synchronize()
//            return true
//        }
//        return false
    }
}
