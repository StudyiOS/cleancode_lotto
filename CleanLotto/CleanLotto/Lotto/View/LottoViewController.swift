//
//  LottoViewController.swift
//  CleanLotto
//
//  Created by elly on 12/9/23.
//

import UIKit
import SnapKit
import Then

class LottoViewController: UIViewController {
    
    private var titleView: UIView = UIView()
    private var lottoRoundTextField: UITextField = UITextField().then {
        $0.text = "1097"
        $0.backgroundColor = .lightGray
        $0.textAlignment = .center
        $0.keyboardType = .numberPad
    }
    private var lottoTitleLabel: UILabel = UILabel().then {
        $0.text = "회 당첨결과"
    }
    private var dateLabel: UILabel = UILabel().then {
        $0.text = "2023-12-10"
    }
    private var lottoBallContainerView: UIStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    private var winnerPriceView: UIView = UIView()
    private var priceLabel: UILabel = UILabel().then {
        $0.text = "254억원"
    }
    private var winnerLabel: UILabel = UILabel().then {
        $0.text = "(10명 / 25억)"
    }
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
    
    private let viewModel = LottoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        viewModel.fetchLottoNumber()
        
        bindViewModel()
        
        addSubviews()
        makeConstraints()
        
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        guard let round = lottoRoundTextField.text else { return }
        viewModel.textRoundEvent = Int(round) ?? 1
    }
    
    private func bindViewModel() {
        viewModel.updateRoundInfo = { [weak self] info in
            guard let info else { return }
            self?.updateUI(by: info)
        }
    }
    
    private func updateUI(by info: LottoInfo) {
        DispatchQueue.main.async {
            self.lottoRoundTextField.text = "\(info.drwNo)"
            self.dateLabel.text = info.drwNoDate
            self.lottoBallContainerView.arrangedSubviews.forEach { $0.removeFromSuperview() }
            
            self.lottoBallContainerView.addArrangedSubview(BallView(info.drwtNo1))
            self.lottoBallContainerView.addArrangedSubview(BallView(info.drwtNo2))
            self.lottoBallContainerView.addArrangedSubview(BallView(info.drwtNo3))
            self.lottoBallContainerView.addArrangedSubview(BallView(info.drwtNo4))
            self.lottoBallContainerView.addArrangedSubview(BallView(info.drwtNo5))
            self.lottoBallContainerView.addArrangedSubview(BallView(info.drwtNo6))
            
            print(info)
            self.priceLabel.text = "\(info.firstAccumamnt.hundredMillion())"
            self.winnerLabel.text = "(\(info.firstPrzwnerCo)명 / \(info.firstWinamnt.hundredMillion()))"
        }
    }
    
    @objc private func leftButtonTapped() {
        viewModel.prevRoundTapEvent = true
    }
    
    @objc private func rightButtonTapped() {
        viewModel.nextRoundTapEvent = true
    }
}

extension LottoViewController: UISubviewStyle {
    func addSubviews() {
        self.view.addSubview(titleView)
        titleView.addSubview(lottoRoundTextField)
        titleView.addSubview(lottoTitleLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(lottoBallContainerView)
        self.view.addSubview(winnerPriceView)
        winnerPriceView.addSubview(priceLabel)
        winnerPriceView.addSubview(winnerLabel)
        self.view.addSubview(leftButton)
        self.view.addSubview(rightButton)
    }
    
    func makeConstraints() {
        titleView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(150)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
        lottoRoundTextField.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
        lottoTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(lottoRoundTextField.snp.trailing).offset(10)
            $0.height.equalTo(30)
            $0.width.equalTo(100)
            $0.trailing.equalToSuperview()
        }
        dateLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleView.snp.bottom).offset(50)
        }
        lottoBallContainerView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(50)
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
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        leftButton.snp.makeConstraints {
            $0.centerY.equalTo(titleView.snp.centerY)
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(80)
        }
        rightButton.snp.makeConstraints {
            $0.centerY.equalTo(titleView.snp.centerY)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.height.equalTo(80)
        }
    }
}
