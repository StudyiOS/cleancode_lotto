//
//  MainViewModel.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import Foundation
import Combine

final class MainViewModel: ViewModelable {
    
    @Published var showResult: Bool = false
    
    enum Action {
        case startSearch
    }
    
    struct State {
        var selectGameNumber: Int
        var lottoResult: Lotto?
    }
    
    var state: State
    var cancellables = Set<AnyCancellable>()
    
    init() {
        self.state = State(selectGameNumber: LottoManager.shared.lastDrawNumber)
    }
    
    func bindAction(_ action: Action) {
        switch action {
        case .startSearch:
            NetworkManager.shared.searchLottoWith(gameNumber: state.selectGameNumber)
                .sink { [weak self] in
                    self?.state.lottoResult = $0
                    self?.showResult = true
                }
                .store(in: &cancellables)
        }
    }
}
