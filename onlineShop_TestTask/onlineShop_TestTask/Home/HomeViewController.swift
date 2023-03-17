// HomeViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class HomeViewController: NavigationController {
    var homeView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        setupCollectionView()
    }

    func setupCollectionView() {
//        homeView.productItemsCollectionView.delegate = self
//        homeView.productItemsCollectionView.dataSource = self
        homeView.productCategoriesCollectionView.delegate = self
        homeView.productCategoriesCollectionView.dataSource = self
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: ProductCategoriesCollectionViewCell.self, for: indexPath)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 50, height: 60)
    }
}
