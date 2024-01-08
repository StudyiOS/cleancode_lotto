//
//  MainViewModel.swift
//  CleanLotto
//
//  Created by Leo on 12/10/23.
//

import SwiftUI
import Combine

extension MainView {
    final class MainViewModel: ObservableObject {
        private var bag: Set<AnyCancellable> = []
        static let INITIAL_ROUND = 1095

        @Published private var lotto: WinningLotto?
        @Published private var round: Int = INITIAL_ROUND

        init() {
            bind()
        }

        private func bind() {
            $round
                .flatMap(DHLotteryAPI.fetchLotto)
                .receive(on: DispatchQueue.main)
                .assign(to: &$lotto)
        }

        func selectedRound(to round: Int) {
            self.round = round
        }

        func getLotto() -> WinningLotto? {
            return lotto
        }
    }
}
