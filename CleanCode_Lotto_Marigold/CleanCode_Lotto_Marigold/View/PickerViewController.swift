//
//  PickerViewController.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/12.
//

import UIKit
import SnapKit
import ReactorKit
import RxCocoa

final class PickerViewController: UIViewController, UISheetPresentationControllerDelegate, View {
    // MARK: - DisposeBag
    var disposeBag = DisposeBag()
    
    // MARK: - PickerData
    var pickerData: [String] = []
    
    // MARK: - SelectedData
    var selectedData: String = String()
    
    // MARK: - Delegate
    weak var delegate: RoundSelectedDelegate?
    
    // MARK: - UI Components
    private let exitButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold, scale: .large)
        let largeCloseImage = UIImage(systemName: "xmark.circle.fill", withConfiguration: largeConfig)
        button.setImage(largeCloseImage, for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    private let selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("SELECT", for: .normal)
        button.titleLabel?.font = .LINESeedBold(size: 18)
        button.setTitleColor(.lottoBlue, for: .normal)
        return button
    }()
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        reactor = PickerViewModel()
    }
}

extension PickerViewController: Bindable {
    func bind(reactor: PickerViewModel) {
        bindAction(reactor)
        bindState(reactor)
    }
    
    func bindAction(_ reactor: Reactor) {
        exitButton.rx.tap
            .map { PickerViewModel.Action.exitButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        selectButton.rx.tap
            .map { PickerViewModel.Action.selectButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    func bindState(_ reactor: Reactor) {
        reactor.state
            .map { $0.pickerControllerIsDismissed }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] exitButtonIsTapped in
                if exitButtonIsTapped {
                    self?.dismiss(animated: true)
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state
            .observe(on: MainScheduler.instance)
            .map { $0.lottoDataIsChanged }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] selectButtonIsTapped in
                if selectButtonIsTapped {
                    self?.sendRoundDataToLottoController()
                    self?.dismiss(animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func sendRoundDataToLottoController() {
        delegate?.roundSelected(selectedData)
    }
}

extension PickerViewController: ViewDrawable {
    func configureUI() {
        setBackgroundColor()
        setAutolayout()
        setSheetPresentationController()
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func setAutolayout() {
        [exitButton, selectButton, pickerView].forEach { view.addSubview($0) }
        
        exitButton.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(15)
            make.top.equalTo(view.snp.top).offset(15)
        }
        
        selectButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-15)
            make.top.equalTo(view.snp.top).offset(15)
        }
        
        pickerView.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.snp.top).offset(50)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    private func setSheetPresentationController() {
        sheetPresentationController.delegate = self
        sheetPresentationController.detents = [.medium()]
    }
}

extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData.reversed()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedData = pickerData.reversed()[row]
    }
    
}
