//
//  Color+Ext.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/13.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

extension Color {
    static let background_black = Color("background_black") ?? Color(hex: "18171D")
    static let box_color = Color("box_color") ?? Color(hex: "272830")
    static let disabled_button_field = Color("disabled_button_field") ?? Color(hex: "C1C1C1")
    static let error_red = Color("error_red") ?? Color(hex: "FF0000")
    static let exercise_disabled = Color("exercise_disabled") ?? Color(hex: "363740")
    static let exercise_level1 = Color("exercise_level1") ?? Color(hex: "F9F9F9")
    static let exercise_level2 = Color("exercise_level2") ?? Color(hex: "CAFFEB")
    static let exercise_level3 = Color("exercise_level3") ?? Color(hex: "6AFFC9")
    static let exercise_level4 = Color("exercise_level4") ?? Color(hex: "00FFA3")
    static let linear = Color("linear") ?? Color(hex: "4EFFF4")
    static let main_green = Color("main_green") ?? Color(hex: "00FFA3")
}
