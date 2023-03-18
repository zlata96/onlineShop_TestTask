// ProductItemsCollectionViewCell.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class ProductItemsCollectionViewCell: UICollectionViewCell {
    var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .bold10
        label.textColor = .black
        label.text = "productNameLabel"
        return label
    }()

    var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .bold8
        label.textColor = .black
        label.text = "productPriceLabel"
        return label
    }()

    var productCategoryView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.backgroundColor = .black
        return view
    }()

    var addProductButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .button
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
        productImageView.addSubview(addProductButton)
        productImageView.addSubview(productCategoryView)
    }

    private func makeConstraints() {
        productImageView.snp.makeConstraints {
            $0.leading.top.bottom.trailing.equalToSuperview()
        }

        productCategoryView.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).offset(8)
            $0.top.equalTo(productImageView.snp.top).inset(92)
            $0.height.equalTo(12)
            $0.width.equalTo(20)
        }

        productPriceLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).offset(8)
            $0.bottom.equalTo(productImageView.snp.bottom).inset(8)
        }

        productNameLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.leading).offset(8)
            $0.top.equalTo(productCategoryView.snp.bottom).offset(8)
        }

        addProductButton.snp.makeConstraints {
            $0.trailing.equalTo(productImageView.snp.trailing).inset(5)
            $0.bottom.equalTo(productImageView.snp.bottom).inset(5)
            $0.size.equalTo(20)
        }
    }
}
