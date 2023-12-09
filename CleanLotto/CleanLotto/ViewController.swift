//
//  ViewController.swift
//  CleanLotto
//
//  Created by 정준영 on 12/10/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    var disposeBag = DisposeBag()
    let networkManager = NetworkManager<LottoAPIService>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // networkManager.request(.getLottoWinInfo(round: 1000), instance: LottoResponse.self) { response in
        //     switch response {
        //     case .success(let result):
        //         dump(result)
        //     case .failure(let error):
        //         dump(error)
        //     }
        
        networkManager.request(.getLottoWinInfo(round: 1000), instance: LottoResponse.self)
            .subscribe(with: self) { (owner, data) in
                dump(data)
            } onFailure: { owner, error in
                dump(error)
            }.disposed(by: disposeBag)

        }


}

