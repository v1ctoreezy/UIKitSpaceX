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

    let mainStack: RocketSettingsView = {
        let settings = RocketSettingsView()
        settings.translatesAutoresizingMaskIntoConstraints = false
        settings.closeButton.addTarget(self, action: #selector(closeSettings), for: .touchUpInside)
        
        settings.heightStack.measureSwitcher.selectedSegmentIndex = UserDefaults.standard.integer(forKey: Settings.heigh.rawValue)
        settings.heightStack.measureSwitcher.addTarget(self, action: #selector(saveChanges), for: .valueChanged)
        settings.diamStack.measureSwitcher.selectedSegmentIndex = UserDefaults.standard.integer(forKey: Settings.diameter.rawValue)
        settings.diamStack.measureSwitcher.addTarget(self, action: #selector(saveChanges), for: .valueChanged)
        settings.weigthStack.measureSwitcher.selectedSegmentIndex = UserDefaults.standard.integer(forKey: Settings.weight.rawValue)
        settings.weigthStack.measureSwitcher.addTarget(self, action: #selector(saveChanges), for: .valueChanged)
        settings.loadStack.measureSwitcher.selectedSegmentIndex = UserDefaults.standard.integer(forKey: Settings.load.rawValue)
        settings.loadStack.measureSwitcher.addTarget(self, action: #selector(saveChanges), for: .valueChanged)
        
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
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height / -2),
        ])
    }
    
    @objc func closeSettings() {
        self.dismiss(animated: true)
    }
    
    @objc func saveChanges() {
        UserDefaults.standard.set(mainStack.heightStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.heigh.rawValue)
        UserDefaults.standard.set(mainStack.diamStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.diameter.rawValue)
        UserDefaults.standard.set(mainStack.weigthStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.weight.rawValue)
        UserDefaults.standard.set(mainStack.loadStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.load.rawValue)
        
        NotificationCenter.default.post(Notification(name: Notification.Name(NotificationNames.gridDataChanged)))
    }
}
