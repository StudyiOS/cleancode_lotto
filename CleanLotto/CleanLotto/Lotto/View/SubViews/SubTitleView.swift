//
//  SubTitleView.swift
//  CleanLotto
//
//  Created by elly on 12/12/23.
//

import UIKit

class SubTitleView: UIView {
    private var winningNumberSubTitleLabel: UILabel = UILabel()
    private var bonusSubTitleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle() {
        self.winningNumberSubTitleLabel.text = NSLocalizedString("Lotto.winning_number", comment: "")
        self.bonusSubTitleLabel.text = NSLocalizedString("Lotto.winning_number_bonus", comment: "")
    }
}

extension SubTitleView: UISubviewStyle {
    func addSubviews() {
        self.addSubview(winningNumberSubTitleLabel)
        self.addSubview(bonusSubTitleLabel)
    }
    
    func makeConstraints() {
        winningNumberSubTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(130)
        }
        bonusSubTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
}

