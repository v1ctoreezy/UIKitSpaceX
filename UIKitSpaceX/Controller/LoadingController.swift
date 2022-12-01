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
    private let notific = NotificationCenter.default
    
    let loadView: LoadingView = {
        let load = LoadingView()
        load.translatesAutoresizingMaskIntoConstraints = false
        return load
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notific = NotificationCenter.default
        notific.addObserver(self, selector: #selector(loaded), name: Notification.Name(NotificationNames.loadedData), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configView()
        getData()
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
        let semaphore = DispatchSemaphore.init(value: 0)
        NetWorkService.shared.getData(url: Urls.launch.rawValue, type: Launch.self) { launches in
            defer { semaphore.signal() }
            self.launches = launches
        }
        semaphore.wait()
        NetWorkService.shared.getData(url: Urls.rocket.rawValue, type: Rocket.self) { rockets in
            defer { semaphore.signal() }
            self.rockets = rockets
        }
        semaphore.wait()
        
        NotificationCenter.default.post(name: Notification.Name(NotificationNames.loadedData), object: nil)
    }
    
    func showPageController() {
        let page = PageController(rockets: rockets, launches: launches)
        navigationController?.pushViewController(page, animated: true)
    }
    
    @objc func loaded() {
        showPageController()
    }
}

