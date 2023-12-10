//
//  Lotto.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/9/23.
//

import Foundation

struct Lotto: Decodable {
    let totSellamnt: Int
    let drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
    
    private enum CodingKeys: String, CodingKey {
        case gameNumber = "drwNo"
        case date = "drwNoDate"
        
        case totalSellAmount = "totSellamnt"
        case firstPrizeTotalAmount = "firstAccumamnt"
        case onePersonFirstPrizeAmount = "firstWinamnt"
        
        case drawNum1 = "drwtNo1"
        case drawNum2 = "drwtNo2"
        case drawNum3 = "drwtNo3"
        case drawNum4 = "drwtNo4"
        case drawNum5 = "drwtNo5"
        case drawNum6 = "drwtNo6"
        case bonusNum = "bnusNo"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.drwNo = try container.decodeIfPresent(Int.self, forKey: .gameNumber) ?? 0
        self.drwNoDate = try container.decodeIfPresent(String.self, forKey: .date) ?? "결과 없음"

        self.totSellamnt = try container.decodeIfPresent(Int.self, forKey: .totalSellAmount) ?? 0
        self.firstAccumamnt = try container.decodeIfPresent(Int.self, forKey: .firstPrizeTotalAmount) ?? 0
        self.firstWinamnt = try container.decodeIfPresent(Int.self, forKey: .onePersonFirstPrizeAmount) ?? 0
        
        self.drwtNo1 = try container.decodeIfPresent(Int.self, forKey: .drawNum1) ?? 0
        self.drwtNo2 = try container.decodeIfPresent(Int.self, forKey: .drawNum2) ?? 0
        self.drwtNo3 = try container.decodeIfPresent(Int.self, forKey: .drawNum3) ?? 0
        self.drwtNo4 = try container.decodeIfPresent(Int.self, forKey: .drawNum4) ?? 0
        self.drwtNo5 = try container.decodeIfPresent(Int.self, forKey: .drawNum5) ?? 0
        self.drwtNo6 = try container.decodeIfPresent(Int.self, forKey: .drawNum6) ?? 0
        
        self.bnusNo = try container.decodeIfPresent(Int.self, forKey: .bonusNum) ?? 0
    }
}

extension Lotto {
    private init() {
        totSellamnt = 1131313131
        firstWinamnt = 12304128
        firstAccumamnt = 123081230
        
        drwNo = 349
        drwNoDate = "2023-11-10"
                
        drwtNo1 = 1
        drwtNo2 = 3
        drwtNo3 = 12
        drwtNo4 = 9
        drwtNo5 = 21
        drwtNo6 = 18
        bnusNo = 8
    }
    
    public var drawNumbers: [Int] {
        [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6]
    }
    
    static let mockData = Lotto()
}
