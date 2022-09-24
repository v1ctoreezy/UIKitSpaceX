//
//  SwitcherDisripView.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 29.08.2022.
//

import UIKit

class SwitcherDisripView: UIView {

    var descriptionS: String?
    var measure1: String?
    var measure2: String?

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = descriptionS
        return label
    }()

    lazy var measureSwitcher: UISegmentedControl = {
        let items = [measure1, measure2]
        let switcher = UISegmentedControl(items: items)
        switcher.layer.cornerRadius = 0
        switcher.tintColor = .black
        return switcher
    }()

    var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()

    init(descr: String, mes1: String, mes2: String) {
        super.init(frame: .zero)

        self.descriptionS = descr
        self.measure1 = mes1
        self.measure2 = mes2
        
        configView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configView() {
        horizontalStack.addArrangedSubview(measureSwitcher)
        horizontalStack.addArrangedSubview(descriptionLabel)
    }
}
