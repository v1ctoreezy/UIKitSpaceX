//
//  CellWithOutMesur.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 25.07.2022.
//

import UIKit

class CellWithOutMesur: UITableViewCell {

    static let identifer = "CellWithOutMesur"
    
    let discription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constant.fontSize)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let data: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: Constant.fontSize)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        
        contentView.addSubview(discription)

        contentView.addSubview(data)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            discription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.horizontalSpacing),
            discription.centerYAnchor.constraint(equalTo: centerYAnchor),

            data.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.horizontalSpacing * 3),
            data.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
