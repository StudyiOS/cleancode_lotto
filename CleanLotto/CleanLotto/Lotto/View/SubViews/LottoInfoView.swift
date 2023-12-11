//
//  LottoInfoView.swift
//  CleanLotto
//
//  Created by elly on 12/12/23.
//

import UIKit

class LottoInfoView: UIView {
    private var dateLabel: UILabel = UILabel()
    private var subTitleView: SubTitleView = SubTitleView()
    private var lottoBallContainerView: LottoBallContainer = LottoBallContainer()
    private var winnerPriceView: UIView = UIView()
    private var priceLabel: UILabel = UILabel()
    private var winnerLabel: UILabel = UILabel()
    private var leftButton: UIButton = UIButton().then {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        let image = UIImage(systemName: "chevron.left.circle", withConfiguration: imageConfig)
        $0.setImage(image, for: .normal)
        $0.tintColor = .black
    }
    private var rightButton: UIButton = UIButton().then {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        let image = UIImage(systemName: "chevron.right.circle", withConfiguration: imageConfig)
        $0.setImage(image, for: .normal)
        $0.tintColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ info: LottoInfo) {
        self.dateLabel.text = info.drwNoDate
        self.subTitleView.setTitle()
        self.lottoBallContainerView.addLottoBalls(by: info.makeLottoBalls())
        self.priceLabel.text = "\(info.firstAccumamnt.hundredMillion())"
        self.winnerLabel.text = "( \(info.firstPrzwnerCo.unit(.numberOfPeople)) / \(info.firstWinamnt.hundredMillion()) )"
    }
}

extension LottoInfoView: UISubviewStyle {
    func addSubviews() {
        self.addSubview(dateLabel)
        self.addSubview(subTitleView)
        self.addSubview(lottoBallContainerView)
        self.addSubview(winnerPriceView)
        winnerPriceView.addSubview(priceLabel)
        winnerPriceView.addSubview(winnerLabel)
    }
    
    func makeConstraints() {
        dateLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(50)
        }
        subTitleView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        lottoBallContainerView.snp.makeConstraints {
            $0.top.equalTo(subTitleView.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(50)
        }
        winnerPriceView.snp.makeConstraints {
            $0.top.equalTo(lottoBallContainerView.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
        priceLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(30)
        }
        winnerLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(priceLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(30)
        }
    }
}
