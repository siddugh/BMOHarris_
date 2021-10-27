//
//  CategoryView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 21/10/21.
//

import UIKit

class CategoryView: UIView {

  var categories: [Cateogory] = [Cateogory]()
  var colourView: UIView = UIView()
  var catagoryLabel: UILabel = UILabel()
  
  var catType: SpendCategoryType = .kClothing
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUPView()
  }
    
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func setUPView() {
    self.addSubview(colourView)
    self.addSubview(catagoryLabel)
    //colourView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    colourView.translatesAutoresizingMaskIntoConstraints = false
    colourView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    colourView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    colourView.widthAnchor.constraint(equalToConstant: 8).isActive = true
    colourView.heightAnchor.constraint(equalToConstant: 8).isActive = true
    colourView.layer.cornerRadius = 4
    
    catagoryLabel.translatesAutoresizingMaskIntoConstraints = false
    catagoryLabel.leadingAnchor.constraint(equalTo: colourView.trailingAnchor, constant: 2).isActive = true
    catagoryLabel.centerYAnchor.constraint(equalTo: colourView.centerYAnchor, constant: 0).isActive = true
    //catagoryLabel.frame = CGRect(x: 20, y: 1, width: 80, height:15)
    catagoryLabel.font = UIFont(name: "Rubik Regular", size: 10)
  }
     
  func setCategory(color: UIColor, txt: String) {
    colourView.backgroundColor = color
    catagoryLabel.text = txt
  }
}

