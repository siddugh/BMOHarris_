//
//  TransactionDetailView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import UIKit

class TransactionDetailView: UIView {

  @IBOutlet weak var bannerImageViewContainer: UIView!
  @IBOutlet weak var bannerImageView: UIView!
  @IBOutlet weak var logoBackgroundView: UIView!
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var brandLabel: UILabel!
  @IBOutlet weak var categoryBackgroundView: UIView!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
    
  @IBOutlet weak var addressView: UIView!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var refreshBackgroundVeiw: UIView!
  @IBOutlet weak var refreshImageView: UIImageView!
  @IBOutlet weak var linkButton: UIButton!

  
  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
  }
  
  
  //Mark: - Private functions
  private func initilize() {
    setupView()
  }
  
  private func setupView() {
    bannerImageViewContainer.layer.cornerRadius = 15
    bannerImageViewContainer.clipsToBounds = true
    bannerImageViewContainer.backgroundColor = .systemPink
        
    bannerImageView.layer.cornerRadius = 15
    bannerImageView.clipsToBounds = true
    
    logoBackgroundView.layer.cornerRadius = 11
    logoBackgroundView.layer.shadowOffset = .zero
    logoBackgroundView.layer.shadowRadius = 4
    logoBackgroundView.layer.shadowOpacity = 0.6
    
    categoryBackgroundView.layer.cornerRadius = 13
    categoryBackgroundView.alpha = 0.6
    
    addressView.layer.cornerRadius = 15
    addressView.layer.shadowOffset = .zero
    addressView.layer.shadowRadius = 2
    addressView.layer.shadowOpacity = 0.5
    
    refreshBackgroundVeiw.layer.cornerRadius = 10
  }
  
  //Mark: - Public functions
}
