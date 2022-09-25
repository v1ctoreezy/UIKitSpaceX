//
//  LoadingView.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 24.09.2022.
//

import UIKit

class LoadingView: UIView {
    let activity: UIActivityIndicatorView = {
        let actv = UIActivityIndicatorView(style: .large)
        actv.translatesAutoresizingMaskIntoConstraints = false
        actv.color = .white
        actv.startAnimating()
        return actv
    }()
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "dsa"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        configActivity()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configActivity() {
        addSubview(activity)

        NSLayoutConstraint.activate([
            activity.centerXAnchor.constraint(equalTo: centerXAnchor),
            activity.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
