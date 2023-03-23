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
        appearance.backgroundColor = .mainBackground
        appearance.titleTextAttributes = [
            .font: UIFont.bold16 ?? .systemFont(ofSize: 16),
            .foregroundColor: UIColor.mainText
        ]
        navigationBar.standardAppearance = appearance
        view.backgroundColor = .mainBackground
    }
}
