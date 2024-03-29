// HomeViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - HomeViewController

class HomeViewController: UIViewController {
    private var homeView = HomeView()

    private let productsService = ProductsService()

    private var productCategories = ProductCategoriesCollectionViewModel.allItems
    private var saleProductsData: [SaleProduct] = []
    private var latestProductsData: [LatestDeal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        setupCollectionViews()
        fetchProducts()
    }

    private func fetchProducts() {
        let group = DispatchGroup()

        group.enter()
        productsService.getSales { saleProducts in
            self.saleProductsData.append(contentsOf: saleProducts)
            // For demo
            self.saleProductsData.append(contentsOf: saleProducts)
            group.leave()
        }

        group.enter()
        productsService.getLatestDeals { latestsProducts in
            self.latestProductsData = latestsProducts
            group.leave()
        }

        group.notify(queue: .main) {
            self.homeView.flashSaleItemsCollectionView.reloadData()
            self.homeView.latestItemsCollectionView.reloadData()
        }
    }

    private func setupCollectionViews() {
        homeView.latestItemsCollectionView.delegate = self
        homeView.latestItemsCollectionView.dataSource = self
        homeView.flashSaleItemsCollectionView.delegate = self
        homeView.flashSaleItemsCollectionView.dataSource = self
        homeView.productCategoriesCollectionView.delegate = self
        homeView.productCategoriesCollectionView.dataSource = self

        homeView.productCategoriesCollectionView.tag = 1
        homeView.latestItemsCollectionView.tag = 2
        homeView.flashSaleItemsCollectionView.tag = 3
    }
}

// MARK: UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        switch collectionView.tag {
        case 1: return productCategories.count
        case 2: return latestProductsData.count
        case 3: return saleProductsData.count
        default: return 0
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell1 = collectionView.dequeueReusableCell(
                withClass: ProductCategoriesCollectionViewCell.self, for: indexPath
            )
            cell1.configure(with: productCategories[indexPath.row])
            return cell1
        case 2:
            let cell2 = collectionView.dequeueReusableCell(
                withClass: LatestProductsCollectionViewCell.self, for: indexPath
            )
            cell2.configure(with: latestProductsData[indexPath.row])
            return cell2
        case 3:
            let cell3 = collectionView.dequeueReusableCell(
                withClass: SaleProductsCollectionViewCell.self, for: indexPath
            )
            cell3.configure(with: saleProductsData[indexPath.row])
            return cell3
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {}

// MARK: UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout _: UICollectionViewLayout,
        sizeForItemAt _: IndexPath
    ) -> CGSize {
        switch collectionView.tag {
        case 1: return CGSize(width: 55, height: 60)
        case 2: return CGSize(width: 114, height: 149)
        case 3: return CGSize(width: 175, height: 221)
        default:
            return CGSize(width: 175, height: 221)
        }
    }
}
