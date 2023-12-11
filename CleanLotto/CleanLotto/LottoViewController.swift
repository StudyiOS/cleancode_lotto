//
//  ViewController.swift
//  Implementing with API
//
//  Created by 정준영 on 2023/08/08.
//

import UIKit

final class LottoViewController: UIViewController {
    
    @IBOutlet weak private var winBackView: UIView!
    @IBOutlet weak private var bonusBackView: UIView!
    @IBOutlet weak private var drwNoLabel: UILabel!
    @IBOutlet weak private var drwNoDateLabel: UILabel!
    @IBOutlet private var ballColorViews: [UIView]!
    @IBOutlet private var drwtNoLabels: [UILabel]!
    @IBOutlet weak private var firstWinamntLabel: UILabel!
    @IBOutlet weak private var numberTextField: UITextField!
    @IBOutlet weak private var selectionButton: UIButton!
    
    private let lottoRoundPicker = UIPickerView()
    private let ballColors: [UIColor] = [.systemYellow, .systemBlue, .systemRed, .darkGray, .systemGreen]
    private var lottoRoundList: [Int] = []
    private let networkManager = NetworkManager<LottoAPIService>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLottoRoundList()
        configureUI()
        configureDelegate()
        getLottoDataFromNetworkManager(round: 1097)
    }
    
    private func makeLottoRoundList() {
        for i in stride(from: 1097, to: 1000, by: -1) {
            lottoRoundList.append(i)
        }
    }
    
    private func configureUI() {
        setupLayout()
        numberTextField.tintColor = .clear
        numberTextField.inputView = lottoRoundPicker
    }
    
    private func setupLayout() {
        ballColorViews.forEach {
            $0.layer.cornerRadius = $0.frame.width / 2
            $0.clipsToBounds = true
        }
        winBackView.layer.cornerRadius = 10
        bonusBackView.layer.cornerRadius = 10
    }
    
    private func configureDelegate() {
        lottoRoundPicker.delegate = self
        lottoRoundPicker.dataSource = self
    }
    
    private func getLottoDataFromNetworkManager(round: Int) {
        networkManager.request(.getLottoWinInfo(round: round), instance: LottoResponse.self) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                updateUI(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func updateUI(_ response: LottoResponse) {
        updateBallColors(response)
        updateNoLabels(response)
        firstWinamntLabel.text = convertNumberFormat(with: response.firstWinamnt)
        drwNoLabel.text = "\(response.drwNo)회"
        drwNoDateLabel.text = convertDateString(with: response.drwNoDate)
    }
    
    private func updateBallColors(_ response: LottoResponse) {
        ballColorViews[0].backgroundColor = ballColors[(response.drwtNo1 - 1) / 10]
        ballColorViews[1].backgroundColor = ballColors[(response.drwtNo2 - 1) / 10]
        ballColorViews[2].backgroundColor = ballColors[(response.drwtNo3 - 1) / 10]
        ballColorViews[3].backgroundColor = ballColors[(response.drwtNo4 - 1) / 10]
        ballColorViews[4].backgroundColor = ballColors[(response.drwtNo5 - 1) / 10]
        ballColorViews[5].backgroundColor = ballColors[(response.drwtNo6 - 1) / 10]
        ballColorViews[6].backgroundColor = ballColors[(response.bnusNo - 1) / 10]
    }
    
    private func updateNoLabels(_ response: LottoResponse) {
        drwtNoLabels[0].text = "\(response.drwtNo1)"
        drwtNoLabels[1].text = "\(response.drwtNo2)"
        drwtNoLabels[2].text = "\(response.drwtNo3)"
        drwtNoLabels[3].text = "\(response.drwtNo4)"
        drwtNoLabels[4].text = "\(response.drwtNo5)"
        drwtNoLabels[5].text = "\(response.drwtNo6)"
        drwtNoLabels[6].text = "\(response.bnusNo)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension LottoViewController {
    private func convertDateString(with dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "yyyy년MM월dd일"
        return dateFormatter.string(from: date!)
    }
    
    private func convertNumberFormat(with num: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: num as NSNumber) ?? ""
        return formattedNumber + "원"
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // 행 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // 열 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lottoRoundList.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getLottoDataFromNetworkManager(round: lottoRoundList[row])
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(lottoRoundList[row])"
    }
}
