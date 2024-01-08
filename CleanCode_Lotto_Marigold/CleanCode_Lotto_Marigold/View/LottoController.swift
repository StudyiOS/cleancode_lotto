//
//  ViewController.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/11.
//

import UIKit
import SnapKit
import RxSwift
import ReactorKit
import RxCocoa

protocol RoundSelectedDelegate: AnyObject {
    func roundSelected(_ round: String)
}

final class LottoController: UIViewController, View {
    // MARK: - DisposeBag
    var disposeBag = DisposeBag()
    
    // MARK: - ViewModel
    private let lottoViewModel = LottoViewModel()
    
    // MARK: - UI Components
    private let lottoHeaderView: LottoHeaderView = {
        let view = LottoHeaderView()
        return view
    }()
    
    private let lottoMainView: LottoMainView = {
        let view = LottoMainView()
        return view
    }()
    
    private let lottoFooterView: LottoFooterView = {
        let view = LottoFooterView()
        return view
    }()
    
    // MARK: - PickerController
    var pickerController: PickerViewController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        reactor = LottoViewModel()
        fetchLotto(round: "1097")
    }
    
    private func fetchLotto(round: String) {
        lottoViewModel.fetchLottoNetwork(round: round)
        setLottoHeader()
        setLottoMain()
        setLottoFooter()
    }
    
    // MARK: - Setting Header Method
    private func setLottoHeader() {
        lottoViewModel.lotto
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] lotto in
                self?.lottoHeaderView.lottoResultDataReceiver = String(lotto.drawNumber)
                self?.lottoHeaderView.lottoDate.text = (self?.change(lottoDateForm: lotto.date))! + " 추첨"
            })
            .disposed(by: disposeBag)
    }
    
    private func change(lottoDateForm: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let changedDate = dateFormatter.date(from: lottoDateForm)
        
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        let result = dateFormatter.string(from: changedDate ?? Date())
        return result
    }
    
    // MARK: - Setting Main Method
    private func setLottoMain() {
        lottoViewModel.lotto
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] lotto in
                self?.lottoMainView.lottoWinningNumbersView.lottoBalls[0].lottoNumber.text = String(lotto.no1)
                self?.lottoMainView.lottoWinningNumbersView.lottoBalls[1].lottoNumber.text = String(lotto.no2)
                self?.lottoMainView.lottoWinningNumbersView.lottoBalls[2].lottoNumber.text = String(lotto.no3)
                self?.lottoMainView.lottoWinningNumbersView.lottoBalls[4].lottoNumber.text = String(lotto.no5)
                self?.lottoMainView.lottoWinningNumbersView.lottoBalls[5].lottoNumber.text = String(lotto.no6)
                
                self?.lottoMainView.bonusView.lottoBall.lottoNumber.text = String(lotto.bonusNumber)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Setting Footer Method
    private func setLottoFooter() {
        lottoViewModel.lotto
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] lotto in
                self?.lottoFooterView.winningAmountLabel.text = self?.monetryUnit(amount: lotto.firstWinnerAmount)
                
            })
            .disposed(by: disposeBag)
    }
    
    private func monetryUnit(amount: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        guard let moneyAmount = numberFormatter.string(from: NSNumber(value: amount)) else { return String() }
        
        return moneyAmount + "원"
    }
}

extension LottoController: Bindable {
    func bind(reactor: LottoViewModel) {
        bindAction(reactor)
        bindState(reactor)
    }
    
    func bindAction(_ reactor: Reactor) {
        lottoFooterView.pickerButton.rx.tap
            .map { LottoViewModel.Action.pickerButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    func bindState(_ reactor: Reactor) {
        reactor.state
            .map { $0.pickerControllerIsShown }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] value in
                if value {
                    self?.presentPickerController()
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func presentPickerController() {
        pickerController = PickerViewController()
        pickerController.delegate = self
        for roundData in 1087...1097 {
            pickerController.pickerData.append("\(roundData)")
        }
        
        self.present(pickerController, animated: true)
    }
}

extension LottoController: ViewDrawable {
    func configureUI() {
        setBackgroundColor()
        setAutolayout()
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func setAutolayout() {
        [lottoHeaderView, lottoMainView, lottoFooterView].forEach { view.addSubview($0) }
        
        lottoHeaderView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(150)
        }
        
        lottoMainView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(lottoHeaderView.snp.bottom)
            make.height.equalTo(150)
        }
        
        lottoFooterView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(lottoMainView.snp.bottom)
            make.height.equalTo(250)
        }
    }
}

extension LottoController: RoundSelectedDelegate {
    func roundSelected(_ round: String) {
        fetchLotto(round: round)
    }
}
