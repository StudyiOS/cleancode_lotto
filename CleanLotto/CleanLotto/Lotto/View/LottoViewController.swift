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
    
    // MARK: - Items
    
    private var titleView: UIView = UIView()
    private var lottoRoundTextField: UITextField = UITextField().then {
        $0.text = "1097"
        $0.backgroundColor = .lightGray
        $0.textAlignment = .center
        $0.keyboardType = .numberPad
    }
    private var lottoTitleLabel: UILabel = UILabel().then {
        $0.text = NSLocalizedString("Lotto.winning_result", comment: "")
    }
    private var dateLabel: UILabel = UILabel().then {
        $0.text = ""
    }
    private var subTitleOfWinningNumber: UILabel = UILabel().then {
        $0.text = NSLocalizedString("Lotto.winning_number", comment: "")
    }
    private var subTitleOfBonus: UILabel = UILabel().then {
        $0.text = NSLocalizedString("Lotto.winning_number_bonus", comment: "")
    }
    private var lottoBallContainerView: LottoBallContainer = LottoBallContainer()
    private var winnerPriceView: UIView = UIView()
    private var priceLabel: UILabel = UILabel().then {
        $0.text = ""
    }
    private var winnerLabel: UILabel = UILabel().then {
        $0.text = ""
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
    
    
    // MARK: - VM
    
    private let viewModel = LottoViewModel()

    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "CleanLotto"
        
        bindViewModel()
        
        addSubviews()
        makeConstraints()
        
        setButtonClickEvent()
        
        viewModel.setInitialLottoRound()
    }
    
    
    // MARK: - Touch Event
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        guard let round = lottoRoundTextField.text else { return }
        viewModel.textRoundEvent = Int(round) ?? 1
    }
    
    
    // MARK: - Binding
    
    private func bindViewModel() {
        viewModel.updateRoundInfo = { [weak self] info in
            guard let info else { return }
            self?.updateUI(by: info)
        }
        
        viewModel.showErrorAlert = { [weak self] error in
            self?.showAlert(of: error)
        }
    }
    
    private func updateUI(by info: LottoInfo) {
        DispatchQueue.main.async {
            self.lottoRoundTextField.text = "\(info.drwNo)"
            self.dateLabel.text = info.drwNoDate
            self.lottoBallContainerView.addLottoBalls(by: info.makeLottoBalls())
            self.priceLabel.text = "\(info.firstAccumamnt.hundredMillion())"
            self.winnerLabel.text = "( \(info.firstPrzwnerCo.unit(.numberOfPeople)) / \(info.firstWinamnt.hundredMillion()) )"
        }
    }
    
    private func showAlert(of errorType: ErrorType) {
        let alert = UIAlertController(title: "에러!!",
                                      message: errorType.description,
                                      preferredStyle: .alert)
        let okAction =  UIAlertAction(title: "ok", style: UIAlertAction.Style.default)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: false)
        }
    }
    
    
    // MARK: - Click Event
    
    private func setButtonClickEvent() {
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
    }
    
    @objc private func leftButtonTapped() {
        viewModel.changeRound(.previous)
    }
    
    @objc private func rightButtonTapped() {
        viewModel.changeRound(.next)
    }
}


// MARK: - SubView Style

extension LottoViewController: UISubviewStyle {
    func addSubviews() {
        self.view.addSubview(titleView)
        titleView.addSubview(lottoRoundTextField)
        titleView.addSubview(lottoTitleLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(subTitleOfWinningNumber)
        self.view.addSubview(subTitleOfBonus)
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
        subTitleOfWinningNumber.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(130)
        }
        subTitleOfBonus.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(50)
            $0.trailing.equalToSuperview().offset(-20)
        }
        lottoBallContainerView.snp.makeConstraints {
            $0.top.equalTo(subTitleOfWinningNumber.snp.bottom).offset(50)
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
