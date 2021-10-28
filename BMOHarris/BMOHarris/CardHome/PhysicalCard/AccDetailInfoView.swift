//
//  AccDetailInfoView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 24/04/21.
//

import UIKit

class AccDetailInfoView: UIView {

  @IBOutlet weak var bgView:UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
  }
  
  func initilize() {
    bgView.layer.cornerRadius = 18
  }

}
