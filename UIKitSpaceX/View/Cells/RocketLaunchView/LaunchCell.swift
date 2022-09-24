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
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var success: Bool? 
    
    private let image: UIImageView = {
        let img = UIImageView(image: UIImage(systemName: "paperplane"), highlightedImage: .none)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        contentView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        contentView.layer.cornerRadius = 15
        
        contentView.addSubview(name)
        contentView.addSubview(dateLabel)
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.horizontalSpacing),
            image.widthAnchor.constraint(equalToConstant: 40),
            
            name.topAnchor.constraint(equalTo: image.topAnchor, constant: -10),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.horizontalSpacing),
            
            dateLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.horizontalSpacing),
        ])
    }
}
