// ProductCategoriesCollectionViewCell.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - ProductCategoriesCollectionViewCell

class ProductCategoriesCollectionViewCell: UICollectionViewCell {
    private var productCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .regular8
        label.textColor = .subTitle
        return label
    }()

    private var productCategoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .profileCycleBackground
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 19
        return imageView
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
    }

    private func addSubviews() {
        addSubview(productCategoryLabel)
        addSubview(productCategoryImageView)
    }

    private func makeConstraints() {
        productCategoryImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(38)
            $0.width.equalTo(42)
        }

        productCategoryLabel.snp.makeConstraints {
            $0.centerX.bottom.equalToSuperview()
        }
    }
}

// MARK: Configurable

extension ProductCategoriesCollectionViewCell: Configurable {
    func configure(with viewModel: ProductCategoriesCollectionViewModel) {
        productCategoryLabel.text = viewModel.name
        productCategoryImageView.image = viewModel.iconImage
    }
}
