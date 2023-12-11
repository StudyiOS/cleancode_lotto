//
//  ErrorType.swift
//  CleanLotto
//
//  Created by elly on 12/12/23.
//

import Foundation

enum ErrorType: Error {
    case urlError
    case emptyDataError
    case noSuccessError
    case decoderError
    
    var description: String {
        switch self {
            case .urlError:
                return NSLocalizedString("Lotto.Error.network_url_error", comment: "")
            case .emptyDataError:
                return NSLocalizedString("Lotto.Error.empty_data_error", comment: "")
            case .noSuccessError:
                return NSLocalizedString("Lotto.Error.no_success_error", comment: "")
            case .decoderError:
                return NSLocalizedString("Lotto.Error.decoder_error", comment: "")
        }
    }
}
