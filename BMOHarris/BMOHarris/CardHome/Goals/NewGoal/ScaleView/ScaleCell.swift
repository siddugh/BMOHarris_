//
//  ScaleCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 29/10/21.
//

import UIKit

class ScaleCell: UICollectionViewCell, ConfigurableCell {

  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var  vBar1: UIView!
  @IBOutlet weak var  vBar2: UIView!
  
  var scaleModel: ScaleModel?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func configure(_ item: ScaleModel, indexPath: IndexPath) {
    self.scaleModel = item
    if indexPath.item == 0 {
      vBar1.alpha = 1
      vBar2.alpha = 0
    } else {
      
      if indexPath.item % 2 == 0 {
        vBar1.alpha = 1
        vBar2.alpha = 0
      } else {
        vBar1.alpha = 0
        vBar2.alpha = 1
      }
    }
  }
  

}
