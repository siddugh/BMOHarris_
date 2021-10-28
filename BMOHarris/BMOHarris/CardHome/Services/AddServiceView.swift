//
//  AddServiceView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 02/05/21.
//

import UIKit

class AddServiceView: UIView {

  @IBOutlet weak var bgView:UIView!
  @IBOutlet weak var imageView:UIImageView!
  @IBOutlet weak var title:UILabel!
  
  
  func initlize() {
    bgView.layer.cornerRadius = 15
  }
}
