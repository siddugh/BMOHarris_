//
//  TransactionCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 24/09/21.
//

import UIKit

class TransactionCell: UICollectionViewCell, ConfigurableCell {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var brandName: UILabel!
  @IBOutlet weak var timeStamp: UILabel!
  @IBOutlet weak var category: UILabel!
  @IBOutlet weak var categoryBackgroundView: UIView!
  @IBOutlet weak var priceLabel: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      setup()
    }
  
  private func setup() {
    categoryBackgroundView.layer.cornerRadius = 5
  }
  
  func reset() {
    imageView.image = nil
    brandName.text = ""
    timeStamp.text = ""
    category.text = ""
    priceLabel.text = ""

  }
  func configure(_ item: TransactionModel, indexPath: IndexPath) {
    reset()
    
    if let img = item.brandLogo {
      imageView.image = UIImage(named: img)
    }
    brandName.text = item.brandName
    timeStamp.text = item.date
    category.text = item.category
    if let colr = item.categorybgColor {
      categoryBackgroundView.backgroundColor = UIColor(hexString: colr, alpha: 0.1)
    }
    priceLabel.text = item.price
  }

}
