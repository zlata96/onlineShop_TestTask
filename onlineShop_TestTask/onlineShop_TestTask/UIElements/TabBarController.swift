// TabBarController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyleTabBar()
        setupTabBarItems()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    private func setupStyleTabBar() {
        tabBar.tintColor = .selectedTabBarItem
        tabBar.unselectedItemTintColor = .subTitle
        tabBar.tintAdjustmentMode = .normal
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.backgroundColor = .white
    }

    private func setupTabBarItems() {
        let firstViewController = HomeViewController()
        firstViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "homeIcon"),
            tag: 0
        )

        let secondViewController = SoonViewController()
        secondViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "chatIcon"),
            tag: 1
        )

        let thirdViewController = ProfileViewController()
        thirdViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "profileIcon"),
            tag: 2
        )

        let fourthViewContrller = SoonViewController()
        fourthViewContrller.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "cartIcon"),
            tag: 3
        )

        let fifthViewController = SoonViewController()
        fifthViewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "favoritesIcon"),
            tag: 4
        )

        viewControllers = [
            firstViewController,
            secondViewController,
            thirdViewController,
            fourthViewContrller,
            fifthViewController,
        ]
        selectedIndex = 0
    }
}
