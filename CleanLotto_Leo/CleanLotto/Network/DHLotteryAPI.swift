//
//  DHLotteryAPI.swift
//  CleanLotto
//
//  Created by Leo on 12/9/23.
//

import Foundation
import Combine

enum DHLotteryAPI {
    static let BASE = "http://www.dhlottery.co.kr/common.do?"

    static func fetchLotto(with winningRound: Int) -> AnyPublisher<WinningLotto?, Never> {
        let METHOD = "method=getLottoNumber"
        let PARAM = "drwNo="

        let FETCH_LOTTO_ADDR = BASE + METHOD + "&" + PARAM + winningRound.toString()

        guard let url = URL(string: FETCH_LOTTO_ADDR) else {
            return Just(nil).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: DHLottoNumber.self, decoder: JSONDecoder())
            .map { WinningLotto(from: $0) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
