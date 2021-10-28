//
//  EmploymentInfoView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

class EmploymentInfoView: UIView {

  @IBOutlet weak var headingLabel:UILabel!
  @IBOutlet weak var textField:UITextField!
  @IBOutlet weak var bgView:UIView!
  @IBOutlet weak var downArrowImageView:UIImageView!
  
  
  func initilize() {
    bgView.layer.cornerRadius = 10
    textField.isUserInteractionEnabled = false
  }
  
}
