//
//  LottoWinningNumbersView.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/11.
//

import UIKit
import SnapKit

final class LottoWinningNumbersView: UIView {
    
    var lottoBalls: [LottoBall] = []
    
    // MARK: - Data
    let lottoBall_WidthAndHeight: CGFloat = 30
    
    // MARK: - UI Components
    private lazy var lottoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
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

extension LottoWinningNumbersView: ViewDrawable {
    
    func configureUI() {
        setAutolayout()
        setBackgroundColor()
    }
    
    func setAutolayout() {
        self.addSubview(lottoStack)
        lottoStack.snp.makeConstraints { make in
            make.center.equalTo(self)
        }

        for _ in 0..<6 {
            lazy var lottoBall: LottoBall = {
                let view = LottoBall()
                view.layer.cornerRadius = lottoBall_WidthAndHeight / 2
                view.layer.masksToBounds = true
                return view
            }()
            
            lottoStack.addArrangedSubview(lottoBall)

            lottoBall.snp.makeConstraints { make in
                make.width.height.equalTo(lottoBall_WidthAndHeight)
            }
            
            lottoBalls.append(lottoBall)
        }
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .lottoBackground
    }
    
    private func getRandomLottoColor() -> UIColor {
        let colors: [UIColor] = [.lottoPurple, .lottoGreen, .lottoPink, .lottoYellow, .lottoBlue]
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        return colors[randomIndex]
    }
}
