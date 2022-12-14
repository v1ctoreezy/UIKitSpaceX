//
//  StartsCell.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 16.08.2022.
//

import UIKit

class LaunchCell: UITableViewCell {
    
    static let identifer = "StartsCell"
    
    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let image: UIImageView = {
        let img = UIImageView(image: UIImage(systemName: "paperplane"), highlightedImage: .none)
        img.tintColor = .gray
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    let status: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        contentView.backgroundColor = Color.uiColor
        contentView.layer.cornerRadius = 15
        
        contentView.addSubview(name)
        contentView.addSubview(dateLabel)
        contentView.addSubview(image)
        contentView.addSubview(status)
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.horizontalSpacing),
            image.widthAnchor.constraint(equalToConstant: 40),

            status.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            status.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -5),
            
            name.topAnchor.constraint(equalTo: image.topAnchor, constant: -10),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.horizontalSpacing),
            
            dateLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.horizontalSpacing),
        ])
    }
}
