//
//  Launch.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 21.08.2022.
//

import Foundation

struct Launch: Codable, Identifiable {
    let rocket: String
    let id: String
    let name: String
    let dateUnix: Int
    let success: Bool?
    
}
