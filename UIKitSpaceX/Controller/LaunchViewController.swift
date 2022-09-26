//
//  StartsViewController.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 16.08.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    var launches: [Launch]
    
    let startsView: RocketLaunchView = {
        let starts = RocketLaunchView()
        starts.translatesAutoresizingMaskIntoConstraints = false
        return starts
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(startsView)
        
        startsView.tableView.delegate = self
        startsView.tableView.dataSource = self
        
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = startsView.nameLabel.text
//        navigationController?.navigationBar.backItem?.title = "Назад"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    init(launches: [Launch]) {
        self.launches = launches
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        NSLayoutConstraint.activate([
            startsView.topAnchor.constraint(equalTo: view.topAnchor),
            startsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            startsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            startsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func transformDate(date: Int) -> String {
        let epocTime = TimeInterval(date)
        let date = NSDate(timeIntervalSince1970: epocTime)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd:'T'HH:mm:ss"
        
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .long
        
        return formatter.string(from: date as Date)
    }
}

extension LaunchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LaunchCell.identifer, for: indexPath) as! LaunchCell
        cell.backgroundColor = .black // RED
        cell.selectionStyle = .none
        
        cell.dateLabel.text = transformDate(date: launches[indexPath.section].dateUnix)
        cell.name.text = launches[indexPath.section].name
        guard let success = launches[indexPath.section].success else { return cell }
        if !success {
            cell.image.transform = CGAffineTransform(rotationAngle: Double.pi)
            cell.status.text = "failure"
            cell.status.textColor = .red
            return cell
        }
        cell.status.text = "success"
        cell.status.textColor = .green
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
