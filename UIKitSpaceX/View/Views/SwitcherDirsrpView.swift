//
//  SettingsStack.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 10.04.2022.
//

import UIKit

class SwitcherDirsrpView: UIView {
    
    var descriptionS: String?
    var measure1: String?
    var measure2: String?
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = descriptionS
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var measureSwitcher: UISegmentedControl = {
        let items = [measure1, measure2]
        let switcher = UISegmentedControl(items: items)
        switcher.backgroundColor = .white
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.selectedSegmentIndex = 0
        switcher.frame.size.height = 50
        return switcher
    }()
    
    init(descr: String, mes1: String, mes2: String) {
        super.init(frame: .zero)
        
        self.descriptionS = descr
        self.measure1 = mes1
        self.measure2 = mes2
        
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .black
        
        addSubview(descriptionLabel)
        addSubview(measureSwitcher)
        measureSwitcher.center = center
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            measureSwitcher.trailingAnchor.constraint(equalTo: trailingAnchor),
            measureSwitcher.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
}
