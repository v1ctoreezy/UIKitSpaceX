//
//  DoubleExtension.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 26.09.2022.
//

import Foundation

extension Double {
    var stringWithoutZeroFraction: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
