//
//  ViewController.swift
//  CleanLotto
//
//  Created by 정준영 on 12/10/23.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func goToLottoButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LottoViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
}

