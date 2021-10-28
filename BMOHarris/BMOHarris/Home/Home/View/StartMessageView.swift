//
//  StartMessageView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 17/04/21.
//

import UIKit

protocol StartMessageViewDelegate:class {
  func start()
}

class StartMessageView: UIView {

  @IBOutlet weak var startButton:UIButton!
  @IBOutlet weak var megLable: UILabel!
  
  weak var delegate: StartMessageViewDelegate?
  
  func initilize() {
    startButton.layer.cornerRadius = 23
  }
  func setTopCornerRadius(radius:CGSize) {
    let path = UIBezierPath(roundedRect: self.frame, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: radius)
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
  }

  @IBAction func startButtonAction(_ sender: Any) {
    delegate?.start()
  }
}
