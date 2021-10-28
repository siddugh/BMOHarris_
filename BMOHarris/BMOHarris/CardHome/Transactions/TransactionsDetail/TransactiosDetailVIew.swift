//
//  TransactiosDetailVIew.swift
//  BMO
//
//  Created by Siddu Hallikeri on 05/05/21.
//

import UIKit

class TransactiosDetailVIew: UIView {

  @IBOutlet weak var largeImag4eContainer: UIView!
  @IBOutlet weak var brandLargeIMage: UIView!
  @IBOutlet weak var logoBgView: UIView!
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var brandName: UILabel!
  @IBOutlet weak var categoryBgView: UIView!
  @IBOutlet weak var addre4ssView: UIView!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var arroyBg: UIView!
  @IBOutlet weak var bannerImage: UIImageView!
  @IBOutlet weak var linkTextView: UITextView!
  
  @IBOutlet weak var largeImageView: UIImageView!
  @IBOutlet weak var linkLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.backgroundColor = .white
    addressLabel.text = "400 Lee St, Des Plaines, IL 60016\nUNited States"
    //initilize()
    self.perform(#selector(initilize), with: nil, afterDelay: 0.1)
  }
  
  
  @objc func initilize() {
    

    largeImag4eContainer.layer.cornerRadius = 15
    largeImag4eContainer.clipsToBounds = true
    largeImag4eContainer.backgroundColor = .systemPink
        
    largeImageView.layer.cornerRadius = 15
    largeImageView.clipsToBounds = true
    
    
    logoBgView.layer.cornerRadius = 11
    logoBgView.layer.shadowOffset = .zero
    logoBgView.layer.shadowRadius = 4
    logoBgView.layer.shadowOpacity = 0.6
    
    categoryBgView.layer.cornerRadius = 13
    categoryBgView.alpha = 0.6
    
    addre4ssView.layer.cornerRadius = 15
    addre4ssView.layer.shadowOffset = .zero
    addre4ssView.layer.shadowRadius = 2
    addre4ssView.layer.shadowOpacity = 0.5
    
    arroyBg.layer.cornerRadius = 10
  }

}
