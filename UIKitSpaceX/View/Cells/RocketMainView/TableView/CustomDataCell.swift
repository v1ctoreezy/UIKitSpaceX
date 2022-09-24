//
//  CustomDataCell.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 25.07.2022.
//

import UIKit

class CustomDataCell: UITableViewCell {
    static let identifer = "CustomDataCell"
    
    let discription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constant.fontSize)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let data: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constant.fontSize, weight: .semibold)
        label.textColor = .white
        label.text = "data"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let measurUnit: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constant.fontSize, weight: .semibold)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        
        contentView.addSubview(discription)
        contentView.addSubview(measurUnit)
        contentView.addSubview(data)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            discription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.horizontalSpacing),
            discription.centerYAnchor.constraint(equalTo: centerYAnchor),

            data.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.horizontalSpacing * 3),
            data.centerYAnchor.constraint(equalTo: centerYAnchor),

            measurUnit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.horizontalSpacing),
            measurUnit.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
