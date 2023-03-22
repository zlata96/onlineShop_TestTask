// HomeNavigationBarRightItem.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class HomeNavigationBarRightItem: UIView {
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "accountPhoto")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    var locationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Location", for: .normal)
        button.setImage(UIImage(named: "pointer"), for: .normal)
        button.backgroundColor = .clear
        button.contentMode = .right
        return button
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
        addSubview(profileImageView)
        addSubview(locationButton)
    }

    private func makeConstraints() {
        profileImageView.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.size.equalTo(30)
        }

        locationButton.snp.makeConstraints {
            $0.height.equalTo(8)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
        }
    }
}
