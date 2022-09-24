//
//  CustomDataCell.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 25.07.2022.
//

import UIKit

class CustomDataTitleCell: UITableViewCell {
    static let identifer = "CustomDataTitleCell"
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black    
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.horizontalSpacing),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
