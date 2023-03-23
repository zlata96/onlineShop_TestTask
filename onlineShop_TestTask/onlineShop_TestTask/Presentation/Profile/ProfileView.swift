// ProfileView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class ProfileView: UIView {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.profile
        label.font = .bold16
        label.textColor = .mainText
        return label
    }()

    private var profilePhotoView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "accountPhoto")
        image.layer.cornerRadius = 30
        return image
    }()

    private var changePhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.changePhoto, for: .normal)
        button.setTitleColor(.subTitle, for: .normal)
        button.titleLabel?.font = .regular8
        button.titleLabel?.textAlignment = .center
        return button
    }()

    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.profileName
        label.font = .bold14
        return label
    }()

    private var uploadButton = BlueButton(text: Texts.uploadItem, withoutImage: false)

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellWithClass: ProfileCell.self)
        tableView.rowHeight = 68
        tableView.separatorStyle = .none
        tableView.backgroundColor = .mainBackground
        return tableView
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
        addSubview(titleLabel)
        addSubview(profilePhotoView)
        addSubview(changePhotoButton)
        addSubview(userNameLabel)
        addSubview(uploadButton)
        addSubview(tableView)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(50)
            $0.height.equalTo(32)
        }

        profilePhotoView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
        }

        changePhotoButton.snp.makeConstraints {
            $0.top.equalTo(profilePhotoView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(15)
        }

        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(changePhotoButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        uploadButton.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(43)
            $0.height.equalTo(40)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(uploadButton.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
