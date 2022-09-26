//
//  ViewController.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 22.07.2022.
//

import UIKit

class RocketMainController: UIViewController {
    
    var rocket: Rocket
    var launches: [Launch]
    
    private lazy var rocketView: MainRocketView = {
        let header =  MainRocketView()
        header.startsButton.addTarget(self, action: #selector(showStarts), for: .touchUpInside)
        header.settingsButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.nameLabel.text = rocket.name
        return header
    }()
    
    let imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.addSubview(imageView)
        scroll.addSubview(rocketView)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .black
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)

        rocketView.tableView.dataSource = self
        rocketView.tableView.delegate = self
        
        view.backgroundColor = .black
        setUp()
    }
    
    func setUp() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -50),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            rocketView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            rocketView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            rocketView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            rocketView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    //MARK: Init
    init(rocket: Rocket, launch: [Launch]) {
        self.rocket = rocket
        self.launches = launch
        imageView.load(url: URL(string: rocket.flickrImages[Int.random(in: 0...rocket.flickrImages.count - 1)])!)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Show methods
    @objc func showStarts() {
        let rocketStarts = LaunchViewController(launches: launches)
        rocketStarts.startsView.nameLabel.text = rocket.name
        navigationController?.pushViewController(rocketStarts, animated: true)
    }
    
    @objc func showSettings() {
        let settings = SettingsViewController()
        present(settings, animated: true)
    }
    
}

    //MARK: Configure table
extension RocketMainController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 { // grid cell
            let cell = tableView.dequeueReusableCell(withIdentifier: GridCell.identifer, for: indexPath) as! GridCell
            cell.rocket = rocket
            return cell
            
        } else if indexPath.section == 1 { // info cells
            let cell = tableView.dequeueReusableCell(withIdentifier: RightCellWithOutMesur.identifer, for: indexPath) as! RightCellWithOutMesur
            let discription = MainRocketHelper.shared.titlesTable[indexPath.section][indexPath.row]
            cell.discription.text = discription
            cell.data.text = rocket.getDataTablesData(key: discription)
//            print(rocket.getDataTablesData(key: discription))
            return cell
            
        } else { // stages cells
            if indexPath.row == 0 { // title cell
                let cell = tableView.dequeueReusableCell(withIdentifier: CustomDataTitleCell.identifer, for: indexPath) as! CustomDataTitleCell
                cell.titleLabel.text = MainRocketHelper.shared.titlesTable[indexPath.section][indexPath.row].uppercased()
                return cell
                
            } else if indexPath.row == 1 { // eng count cell
                let cell = tableView.dequeueReusableCell(withIdentifier: CellWithOutMesur.identifer, for: indexPath) as! CellWithOutMesur
                cell.discription.text = MainRocketHelper.shared.titlesTable[indexPath.section][indexPath.row]
                cell.data.text = rocket.getStagesData(indexPath: indexPath)
                return cell
                
            } else { // fuel count + burn time cells
                let cell = tableView.dequeueReusableCell(withIdentifier: CustomDataCell.identifer, for: indexPath) as! CustomDataCell
                cell.discription.text = MainRocketHelper.shared.titlesTable[indexPath.section][indexPath.row]
                cell.data.text = rocket.getStagesData(indexPath: indexPath)
                if indexPath.row == 2 {
                    cell.measurUnit.text = "ton"
                } else {
                    cell.measurUnit.text = "sec"
                }
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 110
        } else {
            return 50
        }
    }
}
// MARK: Extension for API Image download
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
