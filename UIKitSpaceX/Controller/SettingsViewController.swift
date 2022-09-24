//
//  SettingsViewController.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 16.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(closeSettings), for: .touchUpInside)
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
    
//    lazy var mainStack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [heightStack, diamStack, weigthStack, loadStack])
//        stack.axis = .vertical
//        stack.distribution = .fillEqually
//        stack.spacing = 75
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
    
    let mainStack: RocketSettingsView = {
        let settings = RocketSettingsView()
        settings.translatesAutoresizingMaskIntoConstraints = false
        settings.closeButton.addTarget(self, action: #selector(closeSettings), for: .touchUpInside)
        return settings
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainStack)

        configViews()
    }
    
    func configViews() {
        view.backgroundColor = .black
        constraint()
    }
    
    func constraint() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height / -2)
        ])
    }
    
    @objc func closeSettings() {
        self.dismiss(animated: true)
    }
}

