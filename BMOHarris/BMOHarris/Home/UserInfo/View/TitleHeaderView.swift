//
//  TitleHeaderView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

class TitleHeaderView: UIView {

  @IBOutlet weak var infoImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bgView: UIView!
  
  func initilize() {
    bgView.layer.cornerRadius = 20
  }
  
  func settitle(title:String) {
    titleLabel.text = title
  }
  
  func setInfoImage(image:UIImage) {
    infoImageView.image = image
  }
}
