//
//  LottoHeaderView.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/12.
//

import UIKit
import SnapKit

final class LottoHeaderView: UIView {
    
    // MARK: - Data Receiver
    var lottoResultDataReceiver = String() {
        didSet {
            lottoResult.attributedText = setAttributedTextColor(round: lottoResultDataReceiver)
        }
    }
    
    // MARK: - UI Components
    private let lottoResult: UILabel = {
        let label = UILabel()
        label.font = .LINESeedBold(size: 28)
        label.textColor = .lottoBlack
        label.text = "오늘은"
        return label
    }()
    
    let lottoDate: UILabel = {
        let label = UILabel()
        label.font = .LINESeedRegular(size: 20)
        label.textColor = .systemGray
        label.text = "날짜: "
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension LottoHeaderView: ViewDrawable {
    func configureUI() {
        setBackgroundColor()
        setAutolayout()
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .white
    }
    
    func setAutolayout() {
        [lottoResult, lottoDate].forEach { self.addSubview($0) }
        
        lottoResult.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(50)
        }
        
        lottoDate.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(lottoResult.snp.bottom).offset(30)
        }
    }
    
    private func setAttributedTextColor(round: String) -> NSAttributedString? {
        let fullText = "\(round)회 당첨결과"
        let range = (fullText as NSString).range(of: "\(round)회")
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: UIColor.lottoBlue, range: range)
        return attributedString
    }
}


