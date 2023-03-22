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
        label.labelColorChange(
            for: "Trade by bata",
            color: .button ?? .clear,
            from: 9,
            to: 4,
            font: .bold26 ?? UIFont.systemFont(ofSize: 26)
        )
        return label
    }()

    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "accountPhoto")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    var locationButton = LocationButton()

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
        contentView.addSubview(profileImageView)
        contentView.addSubview(locationButton)
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

        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(20)
            $0.size.equalTo(30)
        }

        locationButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.centerX.equalTo(profileImageView.snp.centerX)
            $0.height.equalTo(8)
            $0.width.equalTo(44)
        }
    }
}
