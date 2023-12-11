//
//  LottoBallContainer.swift
//  CleanLotto
//
//  Created by elly on 12/11/23.
//

import UIKit

class LottoBallContainer: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLotto(_ balls: [Int]) {
        guard !balls.isEmpty else { return }
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
        balls.forEach { self.addArrangedSubview(BallView($0)) }
    }
}
