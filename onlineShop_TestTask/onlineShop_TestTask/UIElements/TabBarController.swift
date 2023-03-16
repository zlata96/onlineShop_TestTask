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
        tabBar.tintColor = .profileCycleBackground
        tabBar.unselectedItemTintColor = .mainBackground
        tabBar.barTintColor = .subTitle
        tabBar.tintAdjustmentMode = .normal
        tabBar.standardAppearance.
    }

    private func setupTabBarItems() {
        let firstViewController = HomeViewController()
        firstViewController.tabBarItem = UITabBarItem(
            title: "Trade by bata",
            image: UIImage(named: "homeIcon"),
            tag: 0
        )

        let secondViewController = ChatViewController()
        secondViewController.tabBarItem = UITabBarItem(
            title: "Chat",
            image: UIImage(named: "chatIcon"),
            tag: 1
        )

        let thirdViewController = ProfileViewController()
        thirdViewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(named: "profileIcon"),
            tag: 2
        )

        let fourthViewContrller = CartViewController()
        fourthViewContrller.tabBarItem = UITabBarItem(
            title: "Cart",
            image: UIImage(named: "cartIcon"),
            tag: 3
        )

        let fifthViewController = FavoritesViewController()
        fifthViewController.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(named: "favoritesIcon"),
            tag: 4
        )

        viewControllers = [
            firstViewController,
            secondViewController,
            thirdViewController,
            fourthViewContrller,
            fifthViewController
        ]
        selectedIndex = 2
    }
}
