// SoonView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class SoonView: UIView {
    private var soonLabel: UILabel = {
        let label = UILabel()
        label.text = "SOON"
        label.font = .bold20
        label.textColor = .mainText
        return label
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
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .mainBackground
    }

    private func addSubviews() {
        addSubview(soonLabel)
    }

    private func makeConstraints() {
        soonLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
