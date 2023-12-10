//
//  MainViewModel.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import Foundation
import Combine

final class MainViewModel: ViewModelable {
    
    enum Action {
        case startSearch
    }
    
    struct State {
        var selectGameNumber: Int
        var lottoResult: Lotto?
    }
    
    var state: State
    private let dataFetcher: LottoFetchable
    private var cancellables = Set<AnyCancellable>()
    
    @Published var showResult: Bool = false
    
    init(dataFetcher: LottoFetchable) {
        self.state = State(selectGameNumber: LottoManager.shared.lastDrawNumber)
        self.dataFetcher = dataFetcher
    }
    
    func bindAction(_ action: Action) {
        switch action {
        case .startSearch:
            dataFetcher.searchLottoWith(gameNumber: state.selectGameNumber)
                .sink { [weak self] in
                    self?.state.lottoResult = $0
                    self?.showResult = true
                }
                .store(in: &cancellables)
        }
    }
}
