//
//  LottoViewModel.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/11.
//

import Foundation
import RxSwift
import ReactorKit

final class LottoViewModel: Reactor {
    var disposebag = DisposeBag()
    
    // MARK: - Network
    private let lottoNetworkManager = LottoNetworkManager(session: .shared)
    
    // MARK: - Subject
    var lotto = PublishSubject<LottoModel>()
    
    // MARK: - Fetch Network
    // 메소드는 스택 영역에 있어서 메소드가 종료되면 스택 내에 있는 인스턴스도 날아가기 때문에
    // 전역 변수로 잡아놓고 있어야 한다. ⭐️⭐️⭐️
    func fetchLottoNetwork(round: String) {
        lottoNetworkManager.getLottoData(round: round)
            .subscribe(onNext: { [weak self] lotto in
                self?.lotto.onNext(lotto)
            })
            .disposed(by: disposebag)
    }
    
    // MARK: - Reactor
    enum Action {
        case pickerButtonTapped
    }
    
    enum Mutation {
        case pickerControllerPresent(Bool)
    }
    
    struct State {
        var pickerControllerIsShown: Bool = false
    }
    
    var initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .pickerButtonTapped:
            return Observable.concat([
                Observable.just(Mutation.pickerControllerPresent(true)),
                Observable.just(Mutation.pickerControllerPresent(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .pickerControllerPresent(let value):
            newState.pickerControllerIsShown = value
        }
        
        return newState
    }
}
