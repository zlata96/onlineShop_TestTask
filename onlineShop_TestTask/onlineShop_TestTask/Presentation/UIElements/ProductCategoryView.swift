// ProductCategoryView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class ProductCategoryView: UIView {
    var categoryName: String
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .bold16
        label.textColor = .mainText
        label.text = categoryName
        return label
    }()

    var viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.viewAll, for: .normal)
        button.setTitleColor(.subTitle, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = .regular8
        return button
    }()

    required init(categoryName: String) {
        self.categoryName = categoryName
        super.init(frame: .zero)
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
        backgroundColor = .clear
    }

    private func addSubviews() {
        addSubview(categoryLabel)
        addSubview(viewAllButton)
    }

    private func makeConstraints() {
        categoryLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }

        viewAllButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
        }
    }
}
