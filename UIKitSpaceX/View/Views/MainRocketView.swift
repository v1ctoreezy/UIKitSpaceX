//
//  MainView.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 15.08.2022.
//

import UIKit

class MainRocketView: UIView {

    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.register(CustomDataTitleCell.self, forCellReuseIdentifier: CustomDataTitleCell.identifer)
        table.register(CustomDataCell.self, forCellReuseIdentifier: CustomDataCell.identifer)
        table.register(CellWithOutMesur.self, forCellReuseIdentifier: CellWithOutMesur.identifer)
        table.register(GridCell.self, forCellReuseIdentifier: GridCell.identifer)
        table.register(RightCellWithOutMesur.self, forCellReuseIdentifier: RightCellWithOutMesur.identifer)

        table.isScrollEnabled = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        table.backgroundColor = .black
        
        return table
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 27.0, weight: .semibold)
        label.text = "Falcon Heavy"
        label.textColor = .white

        label.textAlignment = .left
        return label
    }()

    let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settings"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let startsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.setTitle("Посмотреть запуски", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(nameLabel)
        addSubview(settingsButton)
        addSubview(tableView)
        addSubview(startsButton)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.horizontalSpacing),

            settingsButton.topAnchor.constraint(equalTo: topAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.horizontalSpacing),
            settingsButton.heightAnchor.constraint(equalToConstant: 50),
            settingsButton.widthAnchor.constraint(equalToConstant: 50),

            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: settingsButton.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 800),

            startsButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            startsButton.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: Constant.horizontalSpacing),
            startsButton.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -Constant.horizontalSpacing),
            startsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constant.verticalSpacing),

            startsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
