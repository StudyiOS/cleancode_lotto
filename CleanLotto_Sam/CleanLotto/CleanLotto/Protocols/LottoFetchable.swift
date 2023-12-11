//
//  Network.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import Combine
import Foundation

protocol LottoFetchable {
    func searchLottoWith(gameNumber: Int) -> AnyPublisher<Lotto?, Never>
}
