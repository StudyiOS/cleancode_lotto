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

        @Published var lotto: WinningLotto?
        @Published var round: Int = 1095

        init() {
            bind()
        }

        func bind() {
            $round
                .flatMap(DHLotteryAPI.fetchLotto)
                .receive(on: DispatchQueue.main)
                .assign(to: &$lotto)
        }

        func selectedRound(to round: Int) {
            self.round = round
        }
    }
}
