// FlashSaleCollectionViewCell.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {
    var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .bold20
        label.textColor = .black
        label.text = "product Name"
        label.numberOfLines = 0
        return label
    }()

    var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .bold10
        label.textColor = .black
        label.text = "productPrice"
        return label
    }()

    var productCategoryView = CategoryView()

    var saleAmountView: CategoryView = {
        let view = CategoryView()
        view.backgroundColor = .saleBackground
        return view
    }()

    var personPhotoView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "someonePhoto")
        return imageView
    }()

    var addToCartProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .selectedTabBarItem
        button.contentMode = .center
        button.layer.cornerRadius = 18
        button.backgroundColor = .profileCycleBackground
        return button
    }()

    var addToFavouritiesProductButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setImage(UIImage(named: "favoritesIcon"), for: .normal)
        button.tintColor = .selectedTabBarItem
        button.contentMode = .center
        button.layer.cornerRadius = 14
        button.backgroundColor = .profileCycleBackground
        return button
    }()

    var productImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        return image
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
        addSubviews()
        makeConstraints()
        setupStyle()
    }

    private func setupStyle() {
        backgroundColor = .profileBackground
        contentView.layer.cornerRadius = 16
    }

    private func addSubviews() {
        addSubview(productImageView)
        productImageView.addSubview(productPriceLabel)
        productImageView.addSubview(productNameLabel)
        productImageView.addSubview(addToCartProductButton)
        productImageView.addSubview(addToFavouritiesProductButton)
        productImageView.addSubview(productCategoryView)
        productImageView.addSubview(personPhotoView)
        productImageView.addSubview(saleAmountView)
    }

    private func makeConstraints() {
        productImageView.snp.makeConstraints {
            $0.leading.top.bottom.trailing.equalToSuperview()
        }

        saleAmountView.snp.makeConstraints {
            $0.trailing.equalTo(productImageView.snp.trailing).inset(8)
            $0.top.equalTo(productImageView.snp.top).inset(8)
            $0.height.equalTo(18)
            $0.width.equalTo(50)
        }

        personPhotoView.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).inset(8)
            $0.top.equalTo(productImageView.snp.top).inset(8)
            $0.size.equalTo(24)
        }

        productCategoryView.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).offset(8)
            $0.top.equalTo(productImageView.snp.top).inset(92)
            $0.height.equalTo(18)
            $0.width.equalTo(50)
        }

        productPriceLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).offset(8)
            $0.bottom.equalTo(productImageView.snp.bottom).inset(8)
        }

        productNameLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).offset(8)
            $0.trailing.equalTo(productImageView.snp.trailing).offset(8)
            $0.top.equalTo(productCategoryView.snp.bottom).offset(8)
        }

        addToCartProductButton.snp.makeConstraints {
            $0.trailing.equalTo(productImageView.snp.trailing).inset(5)
            $0.bottom.equalTo(productImageView.snp.bottom).inset(10)
            $0.size.equalTo(36)
        }

        addToFavouritiesProductButton.snp.makeConstraints {
            $0.trailing.equalTo(productImageView.snp.trailing).inset(46)
            $0.bottom.equalTo(productImageView.snp.bottom).inset(10)
            $0.size.equalTo(28)
        }
    }
}

extension FlashSaleCollectionViewCell: Configurable {
    func configure(with viewModel: FlashSale) {
        productNameLabel.text = viewModel.name
        productPriceLabel.text = "$\(viewModel.price)"
    }
}
