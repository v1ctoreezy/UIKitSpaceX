//
//  MainRocketTitles.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 26.08.2022.
//

import Foundation

struct MainRocketHelper {
    static let shared = MainRocketHelper()
    var titlesTable = [
        [
            "Высота",
            "Диаметр",
            "Масса",
            "Нагрузка",
        ],
        [
         "Первый запуск",
         "Страна",
         "Стоимость запуска",
        ],
        [
            "Первая ступень",
            "Количество двигателей",
            "Количество топлива",
            "Время сгорания"
        ],
        [
            "Вторая ступень",
            "Количество двигателей",
            "Количество топлива",
            "Время сгорания"
        ]
    ]
    
}
