//
//  NewGoalCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 04/10/21.
//

import UIKit

class NewGoalCell: UICollectionViewCell, ConfigurableCell  {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  
  func configure(_ item: NewGoalModel, indexPath: IndexPath) {
    if let image = item.image {
      imageView.image = UIImage(named: image)
    }
  }

}
