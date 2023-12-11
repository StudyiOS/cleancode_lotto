//
//  BallColorType.swift
//  CleanLotto
//
//  Created by elly on 12/12/23.
//

import Foundation

enum BallColorType: String, CaseIterable {
    case oneToTen = "#ffff00"               // 노랑
    case elevenToTwenty = "#0091e4"         // 파랑
    case twentyOneToThirty = "#a52a2a"      // 빨강
    case thirtyOneToForty = "#b3b7bf"       // 회색
    case FortyOneToFortyFive = "#00ff00"    // 녹색
    
    var hexColor: String {
        return self.rawValue
    }
}
