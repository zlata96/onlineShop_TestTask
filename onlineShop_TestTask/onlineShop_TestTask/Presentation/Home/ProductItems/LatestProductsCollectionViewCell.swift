// ProductItemsCollectionViewCell.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class LatestProductsCollectionViewCell: UICollectionViewCell {
    private var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .bold10
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .bold10
        label.textColor = .white
        return label
    }()

    private var productCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .regular6
        label.textColor = .mainText
        label.backgroundColor = .categoryBackground?.withAlphaComponent(0.85)
        label.textAlignment = .center
        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true
        return label
    }()

    private var addProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .selectedTabBarItem
        button.contentMode = .center
        button.layer.cornerRadius = 10
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
        backgroundColor = .profileBackground
        contentView.layer.cornerRadius = 16
    }

    private func addSubviews() {
        addSubview(productImageView)
        productImageView.addSubview(productPriceLabel)
        productImageView.addSubview(productNameLabel)
        productImageView.addSubview(addProductButton)
        productImageView.addSubview(productCategoryLabel)
    }

    private func makeConstraints() {
        productImageView.snp.makeConstraints {
            $0.leading.top.bottom.trailing.equalToSuperview()
        }

        productCategoryLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).offset(8)
            $0.top.equalTo(productImageView.snp.top).inset(92)
            $0.height.equalTo(12)
            $0.width.equalTo(30)
        }

        productPriceLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).offset(8)
            $0.bottom.equalTo(productImageView.snp.bottom).inset(8)
        }

        productNameLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).offset(8)
            $0.top.equalTo(productCategoryLabel.snp.bottom).offset(8)
        }

        addProductButton.snp.makeConstraints {
            $0.trailing.equalTo(productImageView.snp.trailing).inset(5)
            $0.bottom.equalTo(productImageView.snp.bottom).inset(5)
            $0.size.equalTo(20)
        }
    }
}

extension LatestProductsCollectionViewCell: Configurable {
    func configure(with viewModel: LatestDeal) {
        productNameLabel.text = viewModel.name
        productPriceLabel.text = "$\(viewModel.price)"
        productImageView.kf.setImage(with: URL(string: viewModel.imageURL))
        productCategoryLabel.text = viewModel.category
    }
}
