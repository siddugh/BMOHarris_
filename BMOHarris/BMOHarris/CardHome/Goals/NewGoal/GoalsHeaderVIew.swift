//
//  GoalsHeaderVIew.swift
//  BMO
//
//  Created by Siddu Hallikeri on 24/04/21.
//

import UIKit

class GoalsHeaderVIew: UICollectionReusableView {

  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var backgroundVIew: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code      
      backgroundVIew.layer.cornerRadius = 16
    }
    
  static var identifier: String {
    return String(describing: self)
  }
  
  static var nib: UINib {
    return UINib(nibName: identifier, bundle: nil)
  }
}
