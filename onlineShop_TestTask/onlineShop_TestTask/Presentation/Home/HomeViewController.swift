// HomeViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class HomeViewController: NavigationController {
    var homeView = HomeView()

    private let productsService = ProductsService()

    private var productCategoriesCollectionViewModel: [ProductCategoriesCollectionViewModel] = [
        ProductCategoriesCollectionViewModel(name: "Phones", iconImage: UIImage(named: "phonesIcon")),
        ProductCategoriesCollectionViewModel(name: "Headphones", iconImage: UIImage(named: "headphonesIcon")),
        ProductCategoriesCollectionViewModel(name: "Games", iconImage: UIImage(named: "gamesIcon")),
        ProductCategoriesCollectionViewModel(name: "Cars", iconImage: UIImage(named: "carsIcon")),
        ProductCategoriesCollectionViewModel(name: "Furniture", iconImage: UIImage(named: "furnitureIcon")),
        ProductCategoriesCollectionViewModel(name: "Kids", iconImage: UIImage(named: "kidsIcon")),
    ]

    private var saleProductsData: [SaleProduct] = []
    private var latestProductsData: [LatestDeal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        setupCollectionViews()
        
        getSalesProducts()
        getLatestProducts()
    }

    func getSalesProducts() {
        productsService.getSales { saleProducts in
            self.saleProductsData = saleProducts
            self.homeView.flashSaleItemsCollectionView.reloadData()
        }
    }
    
    func getLatestProducts() {
        productsService.getLatestDeals { latestsProducts in
            self.latestProductsData = latestsProducts
            self.homeView.latestItemsCollectionView.reloadData()
        }
    }
    
    func setupCollectionViews() {
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

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        switch collectionView.tag {
        case 1: return productCategoriesCollectionViewModel.count
        case 2: return latestProductsData.count
        case 3: return saleProductsData.count
        default:
            return 1
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell1 = collectionView.dequeueReusableCell(withClass: ProductCategoriesCollectionViewCell.self, for: indexPath)
            cell1.configure(with: productCategoriesCollectionViewModel[indexPath.row])
            return cell1
        case 2:
            let cell2 = collectionView.dequeueReusableCell(withClass: ProductItemsCollectionViewCell.self, for: indexPath)
            cell2.configure(with: latestProductsData[indexPath.row])
            return cell2
        case 3:
            let cell3 = collectionView.dequeueReusableCell(withClass: FlashSaleCollectionViewCell.self, for: indexPath)
            cell3.configure(with: saleProductsData[indexPath.row])
            return cell3
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout _: UICollectionViewLayout,
        sizeForItemAt _: IndexPath
    ) -> CGSize {
        switch collectionView.tag {
        case 1: return CGSize(width: 50, height: 60)
        case 2: return CGSize(width: 114, height: 149)
        case 3: return CGSize(width: 175, height: 221)
        default:
            return CGSize(width: 175, height: 221)
        }
    }
}
