// HomeView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class HomeView: UIView {
    private var navigationBar = HomeCustomNavigationBar()

    private var searchBar: SearchBarView = {
        let searchBar = SearchBarView()
        searchBar.layer.masksToBounds = true
        return searchBar
    }()

    var productCategoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: ProductCategoriesCollectionViewCell.self)
        collectionView.backgroundColor = .profileBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private var firstCategoryView = ProductCategoryView(categoryName: "Latest")

    var latestItemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: LatestProductsCollectionViewCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .profileBackground
        return collectionView
    }()

    private var secondCategoryView = ProductCategoryView(categoryName: "Flash Sale")

    var flashSaleItemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: SaleProductsCollectionViewCell.self)
        collectionView.backgroundColor = .profileBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .profileBackground
    }

    private func addSubviews() {
        addSubview(navigationBar)
        addSubview(searchBar)
        addSubview(productCategoriesCollectionView)
        addSubview(firstCategoryView)
        addSubview(latestItemsCollectionView)
        addSubview(secondCategoryView)
        addSubview(flashSaleItemsCollectionView)
    }

    private func makeConstraints() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }

        searchBar.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(262)
        }

        productCategoriesCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }

        firstCategoryView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.equalTo(productCategoriesCollectionView.snp.bottom).offset(36)
            $0.height.equalTo(16)
        }

        latestItemsCollectionView.snp.makeConstraints {
            $0.top.equalTo(firstCategoryView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(150)
        }

        secondCategoryView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.equalTo(latestItemsCollectionView.snp.bottom).offset(36)
            $0.height.equalTo(16)
        }

        flashSaleItemsCollectionView.snp.makeConstraints {
            $0.top.equalTo(secondCategoryView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().offset(12)
            $0.height.equalTo(221)
        }
    }
}
