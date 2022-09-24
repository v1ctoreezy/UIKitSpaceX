//
//  CollectionViewCell.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 30.07.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    var disrip: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        return label
    }()
    var data: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constant.fontSize, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(data)
        contentView.addSubview(disrip)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 35
        self.layer.backgroundColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        
        NSLayoutConstraint.activate([
            data.topAnchor.constraint(equalTo: topAnchor, constant: (contentView.frame.height / 2) - 25),
            data.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            
            disrip.topAnchor.constraint(equalTo: topAnchor, constant: (contentView.frame.height / 2) + 5),
            disrip.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
