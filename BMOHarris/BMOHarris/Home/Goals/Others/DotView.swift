//
//  DotView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

class DotView: UIView {

  @IBOutlet weak var inerDotView:UIView!
  
  func initilize() {    
    inerDotView.layer.cornerRadius = inerDotView.bounds.width / 2
    self.layer.cornerRadius = self.bounds.width / 2
  }

}
