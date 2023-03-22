// HomeCustomNavigationBar.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class HomeCustomNavigationBar: UIView {
    var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "burger")
        return imageView
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Trade by bata"
        label.font = .bold26
        // label.text?.textColorChange(For: "Trade by bata", into: .button ?? .white, from: 9, to: 4)
        return label
    }()

    var rightView = HomeNavigationBarRightItem()

    var contentView: UIView = {
        let view = UIView()
        return view
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
        backgroundColor = .mainBackground
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(contentView)
        contentView.addSubview(leftImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(rightView)
    }

    private func makeConstraints() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        leftImageView.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(22)
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        rightView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(16)
            $0.height.equalTo(50)
            $0.width.equalTo(40)
            $0.centerY.equalToSuperview()
        }
    }
}
