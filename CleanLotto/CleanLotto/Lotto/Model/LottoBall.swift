//
//  LottoBall.swift
//  CleanLotto
//
//  Created by elly on 12/9/23.
//

import Foundation

struct LottoBall {
    let number: Int
    let color: String
    let type: BallType
    
    init(number: Int, type: BallType = .default) {
        self.number = number
        self.color = LottoBall.setColor(number)
        self.type = type
    }
    
    static private func setColor(_ number: Int) -> String {
        let digit = Int(number / 10)
        return BallColorType.allCases[digit].hexColor
    }
    
    enum BallType {
        case `default`
        case bonus
    }
}
