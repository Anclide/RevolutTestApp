//
//  CurrencyTableViewCell.swift
//  RevolutTestApp
//
//  Created by Victor Bogatyrev on 20.09.2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell, UITextFieldDelegate {
  
    @IBOutlet private weak var countryImageView: UIImageView!
    @IBOutlet private weak var currencyAbbreviationLabel: UILabel!
    @IBOutlet private weak var currencyNameLabel: UILabel!
    @IBOutlet private weak var inputTextField: CustomTextField!
  
    private var model: CurrencyModel?
  
    var onValueChanged: ((_ value: Double)->())?
  
    static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        inputTextField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func configureCell(data: Any?) {
        guard let model = data as? CurrencyModel else { return }
        self.model = model
      DispatchQueue.main.async { [weak self] in
        self?.currencyAbbreviationLabel.text = model.name
        self?.inputTextField.text = "\(model.multiplier.rounded(toPlaces: 2))"
      }
    }
  
    @IBAction func textDidChange(_ sender: UITextField) {
      let  value: Double = Double(sender.text ?? "0.0") ?? 0.0
      onValueChanged?(value)
    }
  
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let inputModel = model else { return false }
        if inputModel.isBase {
            return true
        } else {
            return false
        }
    }
  
  
}
