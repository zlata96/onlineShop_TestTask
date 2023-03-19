// HomeViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class HomeViewController: NavigationController {
    var homeView = HomeView()
    
    private var productCategoriesCollectionViewModel: [ProductCategoriesCollectionViewModel] = [
        ProductCategoriesCollectionViewModel(name: "Phones", iconImage: UIImage(named: "phonesIcon")),
        ProductCategoriesCollectionViewModel(name: "Headphones", iconImage: UIImage(named: "headphonesIcon")),
        ProductCategoriesCollectionViewModel(name: "Games", iconImage: UIImage(named: "gamesIcon")),
        ProductCategoriesCollectionViewModel(name: "Cars", iconImage: UIImage(named: "carsIcon")),
        ProductCategoriesCollectionViewModel(name: "Furniture", iconImage: UIImage(named: "furnitureIcon")),
        ProductCategoriesCollectionViewModel(name: "Kids", iconImage: UIImage(named: "kidsIcon"))
    ]

    private var flashSaleData: [FlashSale] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        setupAPI()
        setupCollectionViews()
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1: return productCategoriesCollectionViewModel.count
        case 2: return 3
        case 3: return flashSaleData.count
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
            return cell2
        case 3:
            let cell3 = collectionView.dequeueReusableCell(withClass: FlashSaleCollectionViewCell.self, for: indexPath)
            cell3.configure(with: flashSaleData[indexPath.row])
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
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
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

// MARK: Network

 extension HomeViewController {
    func setupAPI() {
        let api = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        guard let apiURL = URL(string: api) else { fatalError("Error") }

        let session = URLSession(configuration: .default)
        session.dataTask(with: apiURL) { data, response, error in
            guard let data, error == nil else { return }
            do {
                let jsonData = try JSONDecoder().decode(FlashSaleModel.self, from: data)
                 DispatchQueue.main.async {
                     self.flashSaleData = jsonData.flashSale
                print(self.flashSaleData)
                self.homeView.flashSaleItemsCollectionView.reloadData()
                 }
            } catch {
                print(error)
            }

        }.resume()
    }
 }
