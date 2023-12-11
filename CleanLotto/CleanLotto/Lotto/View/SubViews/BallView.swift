//
//  BallView.swift
//  CleanLotto
//
//  Created by elly on 12/9/23.
//

import UIKit

class BallView: UIView {
    let containerView: UIView = UIView()
    lazy var numberLabel: UILabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
    }
    
    init(_ ball: LottoBall) {
        super.init(frame: .zero)
        self.numberLabel.text = "\(ball.number)"
        numberLabel.backgroundColor = UIColor(hex: ball.color)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BallView: UISubviewStyle {
    func addSubviews() {
        self.addSubview(containerView)
        containerView.addSubview(numberLabel)
    }
    
    func makeConstraints() {
        containerView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }
        numberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(50)
        }
    }
}
