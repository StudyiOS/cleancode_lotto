//
//  LottoBall.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/12.
//

import UIKit
import SnapKit

final class LottoBall: UIView {

    // MARK: - Data
    let lottoView_WidthAndHeight: CGFloat = 30
    
    // MARK: - UI Components
    private lazy var lottoView: UIView = {
        let view = UIView()
        view.backgroundColor = self.getRandomLottoColor()
        view.layer.cornerRadius = lottoView_WidthAndHeight / 2
        view.layer.masksToBounds = true
        return view
    }()
    
    let lottoNumber: UILabel = {
        let label = UILabel()
        label.font = .LINESeedRegular(size: 18)
        label.text = "15"
        label.textColor = .white
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

extension LottoBall: ViewDrawable {
    func configureUI() {
        setBackgroundColor()
        setAutolayout()
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .red
    }
    
    func setAutolayout() {
        [lottoView, lottoNumber].forEach { addSubview($0) }
        
        lottoView.snp.makeConstraints { make in
            make.center.equalTo(self.snp.center)
            make.width.height.equalTo(lottoView_WidthAndHeight)
        }
        
        lottoNumber.snp.makeConstraints { make in
            make.center.equalTo(lottoView.snp.center)
        }
    }
    
    private func getRandomLottoColor() -> UIColor {
        let colors: [UIColor] = [.lottoPurple, .lottoGreen, .lottoPink, .lottoYellow, .lottoBlue]
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        return colors[randomIndex]
    }
}
