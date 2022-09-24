////
////  DataTableView.swift
////  UIKitSpaceX
////
////  Created by Виктор Черкасов on 28.07.2022.
////
//
//import UIKit
//
//class DataTableView: UITableView {
//
//    let tableView: UITableView = {
//        let table = UITableView(frame: .zero, style: .grouped)
//
//        table.register(CustomDataTitleCell.self, forCellReuseIdentifier: CustomDataTitleCell.identifer)
//        table.register(CustomDataCell.self, forCellReuseIdentifier: CustomDataCell.identifer)
//        table.register(CellWithOutMesur.self, forCellReuseIdentifier: CellWithOutMesur.identifer)
//        table.register(GridCell.self, forCellReuseIdentifier: GridCell.identifer)
//        table.register(RightCellWithOutMesur.self, forCellReuseIdentifier: RightCellWithOutMesur.identifer)
//
//        table.isScrollEnabled = false
//        table.separatorStyle = UITableViewCell.SeparatorStyle.none
//        table.backgroundColor = .black
//
//        return table
//    }()
//
//    override init(frame: CGRect, style: UITableView.Style) {
//        super.init(frame: frame, style: style)
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//extension DataTableView: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 1
//        } else if section == 1 {
//            return 3
//        } else {
//            return 4
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: GridCell.identifer, for: indexPath)
//            return cell
//        } else if indexPath.section == 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: RightCellWithOutMesur.identifer, for: indexPath)
//            return cell
//        } else {
//            if indexPath.row == 0 {
//                let cell = tableView.dequeueReusableCell(withIdentifier: CustomDataTitleCell.identifer, for: indexPath)
//                return cell
//            } else if indexPath.row == 1 {
//                let cell = tableView.dequeueReusableCell(withIdentifier: RightCellWithOutMesur.identifer, for: indexPath)
//                return cell
//            } else {
//                let cell = tableView.dequeueReusableCell(withIdentifier: CustomDataCell.identifer, for: indexPath)
//                return cell
//            }
//        }
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 110
//        } else {
//            return 50
//        }
//    }
//}

