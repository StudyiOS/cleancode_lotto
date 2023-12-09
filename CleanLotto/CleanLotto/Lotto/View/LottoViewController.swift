//
//  LottoViewController.swift
//  CleanLotto
//
//  Created by elly on 12/9/23.
//

import UIKit

class LottoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let viewModel = LottoViewModel()
        viewModel.fetchLottoNumber()
    }
}

