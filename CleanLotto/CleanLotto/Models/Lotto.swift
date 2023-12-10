//
//  Lotto.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/9/23.
//

import Foundation

struct Lotto: Decodable {
    let drwNoDate: String
    let drwNo: Int
    
    let firstWinamnt : Int
    
    let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6: Int
    let bnusNo: Int
    
    public var drawNumbers: [Int] {
        [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6]
    }
}

extension Lotto {
    static var mockData: Lotto {
        Lotto(drwNoDate: "2023-11-11",
              drwNo: 1002,
              firstWinamnt: 12938713,
              drwtNo1: 3, drwtNo2: 7, drwtNo3: 8, drwtNo4: 12, drwtNo5: 3, drwtNo6: 23,
              bnusNo: 1)
    }
}
