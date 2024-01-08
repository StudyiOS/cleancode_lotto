//
//  Color+.swift
//  CleanLotto
//
//  Created by Leo on 12/10/23.
//

import SwiftUI

extension Color {
    static var background: Self {
        .init(hexString: "227dbd")
    }

    static var text: Self {
        .white
    }

    static var COLOR_1_TO_10: Self {
        .init(hexString: "fbc400")
    }

    static var COLOR_11_TO_20: Self {
        .init(hexString: "69c8f2")
    }

    static var COLOR_21_TO_30: Self {
        .init(hexString: "ff7272")
    }

    static var COLOR_31_TO_40: Self {
        .init(hexString: "aaaaaa")
    }

    static var COLOR_41_TO_45: Self {
        .init(hexString: "b0d840")
    }
    static var tableHeaderBackground: Self {
        .init(hexString: "11629C")
    }

    static func getBallBackgroundColor(in number: Int) -> Color {
        if number <= 10 {
            return .COLOR_1_TO_10
        } else if number <= 20 {
            return .COLOR_11_TO_20
        } else if number <= 30 {
            return .COLOR_21_TO_30
        } else if number <= 40 {
            return .COLOR_31_TO_40
        } else {
            return .COLOR_41_TO_45
        }
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double((hex >> 0) & 0xff) / 255

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }

    init(hexString: String, opacity: Double = 1.0) {
        let hex: Int = Int(hexString, radix: 16)!

        self.init(hex: hex, opacity: opacity)
    }
}
