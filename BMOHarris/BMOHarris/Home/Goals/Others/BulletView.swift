//
//  BulletView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 23/04/21.
//

import UIKit

class BulletView: UIView {

  @IBOutlet weak var selectedView:UIView!
   
  func initilize() {
    self.backgroundColor = .white
    self.layer.cornerRadius = self.bounds.width / 2
    selectedView.layer.cornerRadius = self.bounds.width / 2
  }
  
  func selectView() {
    selectedView.backgroundColor = UIColor(hexString: "2EC430", alpha: 0.55)
  }
  func unSelectView() {
    selectedView.backgroundColor = .white
    
  }

}
