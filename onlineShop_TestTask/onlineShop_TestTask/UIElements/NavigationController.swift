// NavigationController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }

    private func setupStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .profileBackground
        appearance.titleTextAttributes = [
            .font: UIFont.bold26 ?? .systemFont(ofSize: 26),
            .foregroundColor: UIColor.mainText
        ]
        navigationBar.standardAppearance = appearance
        view.backgroundColor = .profileBackground
    }
}
