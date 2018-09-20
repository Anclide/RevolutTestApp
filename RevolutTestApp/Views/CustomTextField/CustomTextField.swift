//
//  CustomTextField.swift
//  RevolutTestApp
//
//  Created by Victor Bogatyrev on 20.09.2018.
//  Copyright © 2018 victorbogatyrev. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
  
  private var bottomLine: UIView!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
  
  override func awakeFromNib() {
    super.awakeFromNib()
    bottomLine = UIView(frame: CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: 1))
    addSubview(bottomLine)
  }

}
