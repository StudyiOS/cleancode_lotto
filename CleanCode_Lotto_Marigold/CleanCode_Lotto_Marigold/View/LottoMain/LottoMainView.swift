//
//  LottoMainView.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/12.
//

import UIKit
import SnapKit

final class LottoMainView: UIView {

    // MARK: - UI Components
    let lottoWinningNumbersView: LottoWinningNumbersView = {
        let view = LottoWinningNumbersView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.tintColor = .lottoBlack
        return imageView
    }()
    
    let bonusView: BonusView = {
        let view = BonusView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let lottoWinningNumbersLabel: UILabel = {
        let label = UILabel()
        label.font = .LINESeedRegular(size: 16)
        label.text = "당첨번호"
        label.textColor = .lottoBlack
        return label
    }()
    
    private let bonusLabel: UILabel = {
        let label = UILabel()
        label.font = .LINESeedRegular(size: 16)
        label.text = "보너스"
        label.textColor = .lottoBlack
        return label
    }()
    
    // MARK: - Stack
    private lazy var lottoWinningStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [lottoWinningNumbersView, plusImageView, bonusView])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension LottoMainView: ViewDrawable {
    func configureUI() {
        setBackgroundColor()
        setAutolayout()
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .white
    }
    
    func setAutolayout() {
        [lottoWinningStack, lottoWinningNumbersLabel, bonusLabel].forEach { self.addSubview($0) }
        
        lottoWinningStack.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(30)
        }
        
        lottoWinningNumbersView.snp.makeConstraints { make in
            make.width.equalTo(255)
            make.height.equalTo(60)
        }
        
        plusImageView.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }

        bonusView.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }
        
        lottoWinningNumbersLabel.snp.makeConstraints { make in
            make.centerX.equalTo(lottoWinningNumbersView.snp.centerX)
            make.top.equalTo(lottoWinningNumbersView.snp.bottom).offset(5)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.centerX.equalTo(bonusView.snp.centerX)
            make.top.equalTo(lottoWinningNumbersView.snp.bottom).offset(5)
        }
    }
}
