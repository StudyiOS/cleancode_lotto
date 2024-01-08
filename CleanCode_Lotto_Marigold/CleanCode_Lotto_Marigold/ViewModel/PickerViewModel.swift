//
//  PickerViewModel.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/13.
//

import Foundation
import ReactorKit

final class PickerViewModel: Reactor {
    var disposebag = DisposeBag()
    
    // MARK: - Reactor
    enum Action {
        case exitButtonTapped
        case selectButtonTapped
    }
    
    enum Mutation {
        case pickerControllerDismiss(Bool)
        case sendDataAndPickerControllerDismiss(Bool)
    }
    
    struct State {
        var pickerControllerIsDismissed: Bool = false
        var lottoDataIsChanged: Bool = false
    }
    
    var initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .exitButtonTapped:
            return Observable.concat([
                Observable.just(Mutation.pickerControllerDismiss(true)),
                Observable.just(Mutation.pickerControllerDismiss(false))
            ])
            
        case .selectButtonTapped:
            return Observable.concat([
                Observable.just(Mutation.sendDataAndPickerControllerDismiss(true)),
                Observable.just(Mutation.sendDataAndPickerControllerDismiss(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .pickerControllerDismiss(let value):
            newState.pickerControllerIsDismissed = value
            
        case .sendDataAndPickerControllerDismiss(let value):
            newState.lottoDataIsChanged = value
        }
        
        return newState
    }
}
