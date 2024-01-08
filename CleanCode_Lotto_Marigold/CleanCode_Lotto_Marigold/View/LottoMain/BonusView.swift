//
//  BonusView.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/11.
//

import UIKit
import SnapKit

final class BonusView: UIView {
    
    // MARK: - Data
    let lottoBall_WidthAndHeight: CGFloat = 30
    
    // MARK: - UI Components
    lazy var lottoBall: LottoBall = {
        let view = LottoBall()
        view.layer.cornerRadius = lottoBall_WidthAndHeight / 2
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension BonusView: ViewDrawable {
    func configureUI() {
        setBackgroundColor()
        setAutolayout()
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .lottoBackground
        
    }
    
    func setAutolayout() {
        [lottoBall].forEach { addSubview($0) }
        
        lottoBall.snp.makeConstraints { make in
            make.center.equalTo(self.snp.center)
            make.width.height.equalTo(lottoBall_WidthAndHeight)
        }
    }
    
    private func getRandomLottoColor() -> UIColor {
        let colors: [UIColor] = [.lottoPurple, .lottoGreen, .lottoPink, .lottoYellow, .lottoBlue]
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        return colors[randomIndex]
    }
}
