//
//  Lotto.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/9/23.
//

import Foundation

struct Lotto: Decodable {
    let totSellamnt: Int?
    let drwNoDate: String?
    let firstWinamnt, drwtNo6, drwtNo4: Int?
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int?
    let drwtNo2, drwtNo3, drwtNo1: Int?
    
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
        
        self.drwNo = try container.decodeIfPresent(Int.self, forKey: .gameNumber)
        self.drwNoDate = try container.decodeIfPresent(String.self, forKey: .date)

        self.totSellamnt = try container.decodeIfPresent(Int.self, forKey: .totalSellAmount)
        self.firstAccumamnt = try container.decodeIfPresent(Int.self, forKey: .firstPrizeTotalAmount)
        self.firstWinamnt = try container.decodeIfPresent(Int.self, forKey: .onePersonFirstPrizeAmount)
        
        self.drwtNo1 = try container.decodeIfPresent(Int.self, forKey: .drawNum1)
        self.drwtNo2 = try container.decodeIfPresent(Int.self, forKey: .drawNum2)
        self.drwtNo3 = try container.decodeIfPresent(Int.self, forKey: .drawNum3)
        self.drwtNo4 = try container.decodeIfPresent(Int.self, forKey: .drawNum4)
        self.drwtNo5 = try container.decodeIfPresent(Int.self, forKey: .drawNum5)
        self.drwtNo6 = try container.decodeIfPresent(Int.self, forKey: .drawNum6)

        self.bnusNo = try container.decodeIfPresent(Int.self, forKey: .bonusNum)
    }
}
