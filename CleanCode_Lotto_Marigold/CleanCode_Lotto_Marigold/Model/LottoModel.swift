//
//  LottoModel.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/11.
//

import Foundation

struct LottoModel: Codable {
    let returnValue: String
    let date: String
    let firstWinnerAmount: Int
    let no1, no2, no3, no4, no5, no6: Int
    let bonusNumber: Int
    let drawNumber: Int
    
    enum CodingKeys: String, CodingKey {
        case returnValue
        case date = "drwNoDate"
        case firstWinnerAmount = "firstWinamnt"
        case no1 = "drwtNo1"
        case no2 = "drwtNo2"
        case no3 = "drwtNo3"
        case no4 = "drwtNo4"
        case no5 = "drwtNo5"
        case no6 = "drwtNo6"
        case bonusNumber = "bnusNo"
        case drawNumber = "drwNo"
    }
}
