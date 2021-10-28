//
//  OptionsView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import UIKit

class OptionView: UIView {

  var selectedView: UIView = UIView()
   
  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
  }
  
  func initilize() {
    self.backgroundColor = .white
    self.layer.cornerRadius = self.bounds.width / 2
    
    self.addSubview(selectedView)
    selectedView.translatesAutoresizingMaskIntoConstraints = false
    selectedView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    selectedView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    selectedView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    selectedView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
    selectedView.layer.cornerRadius = self.bounds.width / 2
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initilize()
  }
    
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func selectView() {
    selectedView.backgroundColor = UIColor(hexString: "2EC430", alpha: 0.55)
  }
  func unSelectView() {
    selectedView.backgroundColor = .white
  }

}
