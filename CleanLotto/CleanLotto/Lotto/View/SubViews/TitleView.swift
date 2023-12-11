//
//  TitleView.swift
//  CleanLotto
//
//  Created by elly on 12/12/23.
//

import UIKit

class TitleView: UIView {
    private var lottoRoundTextField: UITextField = UITextField().then {
        $0.text = "1097"
        $0.backgroundColor = .lightGray
        $0.textAlignment = .center
        $0.keyboardType = .numberPad
    }
    private var lottoTitleLabel: UILabel = UILabel().then {
        $0.text = NSLocalizedString("Lotto.winning_result", comment: "")
    }
    
    var delegate: TextFieldEvent?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lottoRoundTextField.delegate = self
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ info: LottoInfo) {
        self.lottoRoundTextField.text = "\(info.drwNo)"
    }
}

extension TitleView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        delegate?.didEndEditing(text)
    }
}

extension TitleView: UISubviewStyle {
    func addSubviews() {
        self.addSubview(lottoRoundTextField)
        self.addSubview(lottoTitleLabel)
    }
    
    func makeConstraints() {
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
    }
}

protocol TextFieldEvent {
    func didEndEditing(_ text: String)
}
