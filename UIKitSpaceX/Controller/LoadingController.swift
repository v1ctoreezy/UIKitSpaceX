//
//  LoadingController.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 24.09.2022.
//

import UIKit

class LoadingController: UIViewController {
    var rockets = [Rocket]()
    var launches = [Launch]()
    
    let loadView: LoadingView = {
        let load = LoadingView()
        load.translatesAutoresizingMaskIntoConstraints = false
        return load
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configView()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        view.addSubview(loadView)
        NSLayoutConstraint.activate([
            loadView.topAnchor.constraint(equalTo: view.topAnchor),
            loadView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func getData() {
        NetWorkService.shared.getData(url: Urls.rocket.rawValue, type: Rocket.self) { rockets in
            self.rockets = rockets
        }
        NetWorkService.shared.getData(url: Urls.launch.rawValue, type: Launch.self) { launches in
            self.launches = launches
        }
        while rockets.isEmpty || launches.isEmpty { } // Костыль
    }
}
