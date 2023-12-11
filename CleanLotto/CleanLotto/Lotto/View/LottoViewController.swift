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
    
    private var titleView: TitleView = TitleView()
    private var lottoInfoView: LottoInfoView = LottoInfoView()
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
        titleView.delegate = self
        
        bindViewModel()
        
        addSubviews()
        makeConstraints()
        
        setButtonClickEvent()
        
        viewModel.setInitialLottoRound()
    }
    
    
    // MARK: - Touch Event
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
            self.titleView.bind(info)
            self.lottoInfoView.bind(info)
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

extension LottoViewController: TextFieldEvent {
    func didEndEditing(_ text: String) {
        guard let round = Int(text) else { return }
        viewModel.textRoundEvent = round
    }
}


// MARK: - SubView Style

extension LottoViewController: UISubviewStyle {
    func addSubviews() {
        self.view.addSubview(titleView)
        self.view.addSubview(lottoInfoView)
        self.view.addSubview(leftButton)
        self.view.addSubview(rightButton)
    }
    
    func makeConstraints() {
        titleView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(150)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
        lottoInfoView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(50)
            $0.leading.trailing.bottom.equalToSuperview()
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
