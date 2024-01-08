//
//  LottoFooterView.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/12.
//

import UIKit
import SnapKit
import ReactorKit

final class LottoFooterView: UIView {
    // MARK: - UI Components
    private let congratulationLabel: UILabel = {
        let label = UILabel()
        label.font = .LINESeedBold(size: 28)
        label.textColor = .lottoBlue
        label.text = "축하합니다!"
        return label
    }()
    
    let winningAmountLabel: UILabel = {
        let label = UILabel()
        label.font = .LINESeedBold(size: 24)
        label.textColor = .lottoBlack
        label.text = "금액은"
        return label
    }()
    
    let pickerButton: UIButton = {
        let button = UIButton()
        button.setTitle("회차 선택", for: .normal)
        button.backgroundColor = .lottoPurple
        button.titleLabel?.font = .LINESeedRegular(size: 19)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
   
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension LottoFooterView: ViewDrawable {
    func configureUI() {
        setBackgroundColor()
        setAutolayout()
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .white
    }
    
    func setAutolayout() {
        [congratulationLabel, winningAmountLabel, pickerButton].forEach { self.addSubview($0) }
        
        congratulationLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(35)
        }
        
        winningAmountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(congratulationLabel.snp.bottom).offset(20)
        }
        
        pickerButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(winningAmountLabel.snp.bottom).offset(30)
            make.width.equalTo(115)
            make.height.equalTo(40)
        }
    }
}
