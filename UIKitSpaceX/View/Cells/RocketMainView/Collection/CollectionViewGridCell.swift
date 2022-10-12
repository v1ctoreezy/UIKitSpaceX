//
//  CollectionViewCell.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 30.07.2022.
//

import UIKit

class CollectionViewGridCell: UICollectionViewCell {
    static let identifier = "CollectionViewGridCell"
    
    var disrip: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    var data: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: Constant.fontSize)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private var stack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack.addArrangedSubview(data)
        stack.addArrangedSubview(disrip)
        contentView.addSubview(stack)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 35
        self.layer.backgroundColor = Color.cgColor
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
