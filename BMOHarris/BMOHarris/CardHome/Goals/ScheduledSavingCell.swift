//
//  ScheduledSavingCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 26/10/21.
//

import UIKit

struct SavingModel {
  var saving: String
  var timeStamp: String
  var image: String
  var price: String
}

class ScheduledSavingCell: UICollectionViewCell, ConfigurableCell {

  @IBOutlet weak var timeStamp: UILabel!
  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var saving: UILabel!
  @IBOutlet weak var logoImageView: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func reset() {
    timeStamp.text = ""
    price.text = ""
    saving.text = ""
    logoImageView.image = nil
  }
  func configure(_ item: SavingModel, indexPath: IndexPath) {
    timeStamp.text = item.timeStamp
    price.text = item.price
    saving.text = item.saving
    logoImageView.image = UIImage(named: item.image)
  }

}
