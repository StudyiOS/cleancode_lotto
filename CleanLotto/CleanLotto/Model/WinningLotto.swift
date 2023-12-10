//
//  WinningLotto.swift
//  CleanLotto
//
//  Created by Leo on 12/9/23.
//

import Foundation

struct WinningLotto {
    let round: Int
    let numbers: [Int]
    let bonusNumber: Int
    let date: String
    let firstWinnerAmount: Int
    let firstWinners: Int

    init(from lottoNumber: DHLottoNumber) {
        self.round = lottoNumber.drwNo
        self.numbers = [lottoNumber.drwtNo1,
                        lottoNumber.drwtNo2,
                        lottoNumber.drwtNo3,
                        lottoNumber.drwtNo4,
                        lottoNumber.drwtNo5,
                        lottoNumber.drwtNo6]
        self.bonusNumber = lottoNumber.bnusNo
        self.date = lottoNumber.drwNoDate
        self.firstWinnerAmount = lottoNumber.firstWinamnt
        self.firstWinners = lottoNumber.firstPrzwnerCo
    }
}
