// HomeView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class HomeView: UIView {
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "What are you looking for?"
        searchBar.searchTextField.font = UIFont.regular10
        searchBar.searchTextField.textAlignment = .center
        searchBar.layer.cornerRadius = 12
        searchBar.barTintColor = .searchBarBackground
        searchBar.layer.masksToBounds = true
        return searchBar
    }()

    var firstCategoryView = ProductCategoryView(categoryName: "Latest")

    var productItemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: ProductItemsCollectionViewCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .profileBackground
        return collectionView
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
        addSubview(searchBar)
//        addSubview(firstCategoryView)
//        addSubview(productItemsCollectionView)
        addSubview(productCategoriesCollectionView)
    }

    private func makeConstraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(262)
        }

//        firstCategoryView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview().inset(12)
//            $0.top.equalTo(searchBar.snp.bottom).offset(36)
//            $0.height.equalTo(16)
//        }
//
//        productItemsCollectionView.snp.makeConstraints {
//            $0.top.equalTo(firstCategoryView.snp.bottom).offset(8)
//            $0.leading.trailing.equalToSuperview().inset(12)
//            $0.height.equalTo(150)
//        }

        productCategoriesCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(60)
        }
    }
}
