//
//  ReviewNewGoalCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 26/10/21.
//

import UIKit

class ReviewNewGoalCell: UICollectionViewCell {
    
  var reviewNewGoalVIew: ReviewNewGoalVIew!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  func setupUI() {
    reviewNewGoalVIew = Bundle.main.loadNibNamed("ReviewNewGoalVIew", owner: self, options: nil)!.first as? ReviewNewGoalVIew
    reviewNewGoalVIew.initilize()
    reviewNewGoalVIew.initilize()
    self.addSubview(reviewNewGoalVIew)
    //reviewNewGoalVIew.frame = self.bounds
    reviewNewGoalVIew.translatesAutoresizingMaskIntoConstraints = false
    
    reviewNewGoalVIew.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
    reviewNewGoalVIew.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
    reviewNewGoalVIew.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    reviewNewGoalVIew.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 25).isActive = true
        
  }
  
  static var identifier: String {
    return String(describing: self)
  }
  
  static var nib: UINib {
    return UINib(nibName: identifier, bundle: nil)
  }


}
