//
//  Constants.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 19.08.2022.
//

import Foundation
import UIKit

enum Settings: String, CaseIterable {
    case heigh = "heigh"
    case diameter = "diameter"
    case weight = "weight"
    case load = "payload"
}

enum Constant {
    static let horizontalSpacing: CGFloat = 32.0
    static let verticalSpacing: CGFloat = 40.0
    static let cornerRadius: CGFloat = 32.0
    static let fontSize: CGFloat = 18.0
    
//    enum Colors {
//        static let basicColor = UIColor(hex: 0xCACACA)
//        static let basicTextColor = UIColor(hex: 0xF6F6F6)
//        static let lightTextColor = UIColor(hex: 0xFFFFFF)
//        static let unitsTextColor = UIColor(hex: 0x8E8E8F)
//        static let collectionViewCellColor = UIColor(hex: 0x212121)
//    }
}
