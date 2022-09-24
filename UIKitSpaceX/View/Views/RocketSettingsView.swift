//
//  RocketSettingsView.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 16.08.2022.
//

import UIKit

class RocketSettingsView: UIView {
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Закрыть", for: .normal)
        return button
    }()
    
    let name: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.text = "Настройки"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var headerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [name, closeButton])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let heightStack: SwitcherDirsrpView = {
        let stack = SwitcherDirsrpView(descr: "Высота", mes1: "m", mes2: "ft")
        return stack
    }()
    
    let diamStack: SwitcherDirsrpView = {
        let stack = SwitcherDirsrpView(descr: "Диаметр", mes1: "m", mes2: "ft")
        return stack
    }()
    
    let weigthStack: SwitcherDirsrpView = {
        let stack = SwitcherDirsrpView(descr: "Масса", mes1: "kg", mes2: "lb")
        return stack
    }()
    
    let loadStack: SwitcherDirsrpView = {
        let stack = SwitcherDirsrpView(descr: "Полезная нагрузка", mes1: "kg", mes2: "lb")
        return stack
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [heightStack, diamStack, weigthStack, loadStack])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(mainStack)
        addSubview(name)
        addSubview(closeButton)
        addSubview(headerStack)
        constraintViews()
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            headerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
            headerStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerStack.topAnchor.constraint(equalTo: topAnchor),
            
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStack.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 30),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: frame.height / -2)
        ])
    }
}
