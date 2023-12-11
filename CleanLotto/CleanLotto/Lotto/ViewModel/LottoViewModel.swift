//
//  LottoViewModel.swift
//  CleanLotto
//
//  Created by elly on 12/9/23.
//

import Foundation

class LottoViewModel {
    
    // MARK: - Properties
    
    private var lottoInfo: LottoInfo? {
        didSet {
            updateRoundInfo(lottoInfo)
        }
    }
    private(set) var currentRound: Int = 1097 {
        didSet {
            fetchLottoNumber()
        }
    }
    
    
    // MARK: - Input (VC -> VM)
    
    var textRoundEvent: Int = 0 {
        didSet {
            currentRound = textRoundEvent
        }
    }
    
    func changeRound(_ type: ChangeRoundType) {
        currentRound += type.value
    }
    
    
    // MARK: - Output (VM -> VC)
    
    var updateRoundInfo: (LottoInfo?) -> Void = { _ in }
    
    var showErrorAlert: (ErrorType) -> Void = { _ in }
    
    
    // MARK: - Method
    
    func setInitialLottoRound() {
        textRoundEvent = 1097
    }
    
    private func fetchLottoNumber() {
        Task {
            do {
                lottoInfo = try await NetworkManager.shared.request(currentRound)
            } catch {
                handleFetchError(error)
            }
        }
    }
    
    private func handleFetchError(_ error: Error) {
        guard let errorType = error as? ErrorType else { return }
        showErrorAlert(errorType)
    }
}
