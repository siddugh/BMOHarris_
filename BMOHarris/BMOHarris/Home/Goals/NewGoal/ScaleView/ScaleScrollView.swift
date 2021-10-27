//
//  ScaleScrollView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 01/10/21.
//

import UIKit

class ScaleScrollView: UIScrollView {

  
  @IBOutlet weak var scaleView: ScaleView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initiize()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initiize()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
      
  private func initiize() {    
  }
}
