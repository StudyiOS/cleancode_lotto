//
//  BallView.swift
//  CleanLotto
//
//  Created by elly on 12/9/23.
//

import UIKit

class BallView: UIView {
    private var ballColors: [UIColor] = [.yellow, .blue, .red, .gray, .green]
    
    let containerView: UIView = UIView()
    lazy var numberLabel: UILabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
    }
    
    init(_ number: Int) {
        super.init(frame: .zero)
        self.numberLabel.text = "\(number)"
        let index = Int(number / 10)
        numberLabel.backgroundColor = ballColors[index]
        
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
