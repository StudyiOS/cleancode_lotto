//
//  MockNetworkManager.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import Foundation
import Combine

final class MockLottoFetcher: LottoFetchable {
    func searchLottoWith(gameNumber: Int) -> AnyPublisher<Lotto?, Never> {
        let mockLotto = Lotto(drwNoDate: "2023-11-28", drwNo: gameNumber,
                              firstWinamnt: 12937887,
                              drwtNo1: 7, drwtNo2: 8, drwtNo3: 13, drwtNo4: 21, drwtNo5: 9, drwtNo6: 1,
                              bnusNo: 13)
        return Just(mockLotto)
            .eraseToAnyPublisher()
    }
}
