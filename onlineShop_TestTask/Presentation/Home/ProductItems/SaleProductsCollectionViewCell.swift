// SaleProductsCollectionViewCell.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Kingfisher
import UIKit

class SaleProductsCollectionViewCell: UICollectionViewCell {
    private var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .bold16
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .bold14
        label.textColor = .white
        return label
    }()

    private var productCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .bold10
        label.textColor = .mainText
        label.backgroundColor = .categoryBackground?.withAlphaComponent(0.85)
        label.textAlignment = .center
        label.layer.cornerRadius = 9
        label.layer.masksToBounds = true
        return label
    }()

    private var saleAmountLabel: UILabel = {
        let label = UILabel()
        label.font = .bold10
        label.textColor = .white
        label.backgroundColor = .saleBackground
        label.textAlignment = .center
        label.layer.cornerRadius = 9
        label.layer.masksToBounds = true
        return label
    }()

    private var personPhotoView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "someonePhoto")
        return imageView
    }()

    private var addToCartProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .selectedTabBarItem
        button.contentMode = .center
        button.layer.cornerRadius = 18
        button.backgroundColor = .profileCycleBackground
        return button
    }()

    private var addToFavouritiesProductButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setImage(UIImage(named: "favoritesIcon"), for: .normal)
        button.tintColor = .selectedTabBarItem
        button.contentMode = .center
        button.layer.cornerRadius = 14
        button.backgroundColor = .profileCycleBackground
        return button
    }()

    private var productImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
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
        backgroundColor = .mainBackground
        contentView.layer.cornerRadius = 16
    }

    private func addSubviews() {
        addSubview(productImageView)
        productImageView.addSubview(productPriceLabel)
        productImageView.addSubview(productNameLabel)
        productImageView.addSubview(addToCartProductButton)
        productImageView.addSubview(addToFavouritiesProductButton)
        productImageView.addSubview(productCategoryLabel)
        productImageView.addSubview(personPhotoView)
        productImageView.addSubview(saleAmountLabel)
    }

    private func makeConstraints() {
        productImageView.snp.makeConstraints {
            $0.leading.top.bottom.trailing.equalToSuperview()
        }

        saleAmountLabel.snp.makeConstraints {
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

        productCategoryLabel.snp.makeConstraints {
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
            $0.top.equalTo(productCategoryLabel.snp.bottom).offset(12)
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

extension SaleProductsCollectionViewCell: Configurable {
    func configure(with viewModel: SaleProduct) {
        productNameLabel.text = viewModel.name
        productPriceLabel.text = "$\(viewModel.price)"
        productImageView.kf.setImage(with: URL(string: viewModel.imageURL))
        saleAmountLabel.text = "\(viewModel.discount)% off"
        productCategoryLabel.text = viewModel.category
    }
}
