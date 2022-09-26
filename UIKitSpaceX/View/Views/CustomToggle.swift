//
//  CustomToggle.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 08.10.2022.
//

import Foundation
import UIKit

class CustomToggle: UIView {
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    let measure1: UILabel = {
        let measure = UILabel()
        measure.translatesAutoresizingMaskIntoConstraints = true
        measure.textColor = .red
        measure.text = "213"
        return measure
    }()
    let measure2: UILabel = {
        let measure = UILabel()
        measure.translatesAutoresizingMaskIntoConstraints = true
        return measure
    }()
    
//    init(measure1: String, measure2: String) {
//        self.measure1 = measure1
//        self.measure2 = measure2
//        super.init()
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        view.addSubview(measure1)
        view.addSubview(measure2)
        addSubview(view)
        
        NSLayoutConstraint.activate([
            measure1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            measure1.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            measure2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            measure2.topAnchor.constraint(equalTo: view.topAnchor, constant: 15)
        ])
    }
    
}

extension UISegmentedControl {

}
