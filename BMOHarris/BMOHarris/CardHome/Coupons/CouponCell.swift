//
//  CouponCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import UIKit

class CouponCell: UICollectionViewCell, ConfigurableCell {

  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var bannerImageView: UIImageView!
  @IBOutlet weak var couponlogoImageView: UIImageView!
  @IBOutlet weak var offerPriceLabel: UILabel!
  @IBOutlet weak var redeemBackgroundView: UIView!
  @IBOutlet weak var redeemLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
  
    private func setupView() {
      redeemBackgroundView.layer.cornerRadius = 8
      redeemBackgroundView.backgroundColor = UIColor(hexString: "2F9556")
      
      containerView.layer.cornerRadius = 10
      containerView.clipsToBounds = true
      self.layer.cornerRadius = 10
    }
  
  func configure(_ item: CouponModel, indexPath: IndexPath) {
    
  }
  
}
