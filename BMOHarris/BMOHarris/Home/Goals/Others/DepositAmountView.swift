//
//  DepositAmountView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

protocol DepositAmountViewDelegate:class {
  func depositAmount()
}

class DepositAmountView: UIView {

  @IBOutlet var dotViews: [DotView]!
  //@IBOutlet weak var depositButton: UIButton!
  @IBOutlet weak var depositButton: UIButton!
  @IBOutlet weak var bgView: UIView!
  
  weak var delegate: DepositAmountViewDelegate?
  
  
  func initilize() {
    dotViews[0].inerDotView.backgroundColor = .clear
    depositButton.layer.cornerRadius = 20
    
    bgView.layer.cornerRadius = 15
    //bgView.layer.
    
    
    dotViews.forEach { (dotView) in
      dotView.initilize()
    }
  }

  @IBAction func depositButtonAction(_ sender: Any) {
    delegate?.depositAmount()
  }
}
