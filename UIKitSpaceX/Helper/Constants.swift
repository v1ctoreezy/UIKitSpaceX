//
//  Constants.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 19.08.2022.
//

import Foundation
import UIKit

enum Settings: String, CaseIterable {
    case heigh = "height"
    case diameter = "diameter"
    case weight = "weight"
    case load = "payload"
}

enum Urls: String {
    case rocket = "https://api.spacexdata.com/v4/rockets"
    case launch = "https://api.spacexdata.com/v4/launches"
}


enum Constant {
    static let horizontalSpacing: CGFloat = 32.0
    static let verticalSpacing: CGFloat = 40.0
    static let cornerRadius: CGFloat = 32.0
    static let fontSize: CGFloat = 18.0
    static let headerFont: CGFloat = 27.0
}

enum NotificationNames {
    static let gridDataChanged = "changed"
    static let loadedData = "dataLoaded"
}

enum Color {
    static let uiColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
    static let cgColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
}
