//
//  CurrencyTableViewCell.swift
//  RevolutTestApp
//
//  Created by Victor Bogatyrev on 20.09.2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
  
    @IBOutlet private weak var countryImageView: UIImageView!
    @IBOutlet private weak var currencyAbbreviationLabel: UILabel!
    @IBOutlet private weak var currencyNameLabel: UILabel!
    @IBOutlet private weak var inputTextField: CustomTextField!
  
    static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func configureCell(data: Any?) {
        guard let model = data as? CurrencyModel else { return }
        currencyAbbreviationLabel.text = model.name
    }
  
    
}
