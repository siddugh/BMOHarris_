//
//  PhotoMessage.swift
//  BMO
//
//  Created by Siddu Hallikeri on 17/04/21.
//

import UIKit

class PhotoMessage: UIView {

  @IBOutlet weak var checkmarkBGView: UIView!
  @IBOutlet weak var secondMessageLabel: UILabel!
  @IBOutlet weak var firstMessageLabel: UILabel!
  
  func initilize() {
    checkmarkBGView.layer.cornerRadius = checkmarkBGView.frame.width / 2
  }
}
