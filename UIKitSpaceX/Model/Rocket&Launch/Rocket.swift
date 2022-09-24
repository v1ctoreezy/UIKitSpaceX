//
//  Rocket.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 21.08.2022.
//

import Foundation

struct Rocket: Codable, Identifiable {
    let firstFlight, name, country, id: String
    let costPerLaunch: Int
    let secondStage, firstStage: StageInfo
    let height: HeightInfo
    let mass: MassInfo
    let diameter: DiameterInfo
    let payloadWeights: [PayloadElement]
    let flickrImages: [String]
    
    func gridData(indexPath: IndexPath, mesurePick: Int) -> (Double, String) {
        let titlesTable: [Int: [(Double, String)]] = [
            0 : [
                (self.height.meters ?? 0.0, "m"),
                (self.height.feet ?? 0.0, "ft")
            ],
            1 : [
                (self.diameter.meters, "m"),
                (self.diameter.feet, "ft")
            ],
            2 : [
                (self.mass.kg, "kg"),
                (self.mass.lb, "lb")
            ],
            3 : [
                (self.payloadWeights[0].kg, "kg"),
                (self.payloadWeights[0].lb, "lb")
            ],
        ]
        return titlesTable[indexPath.row]![mesurePick]
    }
    
    func getDataTablesData(key: String) -> String {
        let titlesTable: [String: String] = [
            "Первый запуск": dateFormatter(date: self.firstFlight),
            "Страна": translateCountry(key: self.country),
            "Стоимость запуска": costFormatter(cost: self.costPerLaunch)
        ]
        return titlesTable[key]!
    }
    
    func getStagesData(indexPath: IndexPath) -> String {
        let stages: [Int: [Int: String]] = [
            2 : [
                1 : String(self.firstStage.engines),
                2 : String(self.firstStage.fuelAmountTons),
                3 : String(self.firstStage.burnTimeSec ?? 0),
            ],
            3 : [
                1 : String(self.secondStage.engines),
                2 : String(self.secondStage.fuelAmountTons),
                3 : String(self.secondStage.burnTimeSec ?? 0)
            ]
        ]
        return stages[indexPath.section]?[indexPath.row] ?? "0"
    }
    
    private func translateCountry(key: String) -> String {
        let country: [String: String] = [
            "Republic of the Marshall Islands" : "Республика Маршалловы о-ва",
            "United States" : "США"
        ]
        
        return country[key]!
    }
    
    private func costFormatter(cost: Int) -> String {
        return "$\(Double(cost) / 1000000) млн"
    }
    
    private func dateFormatter(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let date = formatter.date(from: date)!
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .long
        
        return formatter.string(from: date)
    }
}

struct PayloadElement: Codable {
    let id:String
    let name: String
    let kg: Double
    let lb: Double
}

struct DiameterInfo: Codable {
    let meters: Double
    let feet: Double
}

struct HeightInfo: Codable {
    let meters: Double?
    let feet: Double?
}

struct MassInfo: Codable {
    let kg: Double
    let lb: Double
}

struct StageInfo: Codable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?
}

