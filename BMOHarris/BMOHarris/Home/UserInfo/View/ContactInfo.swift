//
//  ContactInfo.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

class ContactInfo: UIView {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var infoTxtField: UITextField!
  @IBOutlet weak var bgView: UIView!
  
  func initilize() {
    bgView.layer.cornerRadius = 12
  }
  
  

}
