// CategoryView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class CategoryView: UIView {
    var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = .regular8
        mainLabel.textColor = .mainText
        return mainLabel
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
        backgroundColor = .categoryBackground?.withAlphaComponent(0.85)
        layer.cornerRadius = 9
    }

    private func addSubviews() {
        addSubview(mainLabel)
    }

    private func makeConstraints() {
        mainLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
