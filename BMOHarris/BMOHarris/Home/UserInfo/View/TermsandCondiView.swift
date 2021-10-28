//
//  TermsandCondiView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

protocol TermsandCondiViewDelegate:class {
  func moveNext()
  func moveBack()
}

class TermsandCondiView: UIView {

  @IBOutlet weak var checkBoxView: UIView!
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var backButton: UIButton!
  
  weak var delegate: TermsandCondiViewDelegate?
  
  func initilize() {
    checkBoxView.layer.cornerRadius = 8
    nextButton.layer.cornerRadius = 23
  }
  
  @IBAction func nextButtonAction(_ sender: Any) {
    delegate?.moveNext()
  }
  
  @IBAction func backButtonAction(_ sender: Any) {
    delegate?.moveBack()
  }
  
}
