//
//  PaymentCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import UIKit

class PaymentCell: UICollectionViewCell, ConfigurableCell {

  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var payment: UILabel!
  @IBOutlet weak var timeStampLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var typeBackgroundView: UIView!
  @IBOutlet weak var amountLabel: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      setupView()
    }

  private func setupView() {
    typeBackgroundView.layer.cornerRadius = 8
  }
    
  func configure(_ item: PaymentModel, indexPath: IndexPath) {
    
  }
}
