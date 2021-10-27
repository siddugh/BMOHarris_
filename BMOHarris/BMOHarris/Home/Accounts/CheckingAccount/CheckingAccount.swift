//
//  CheckingAccountView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 22/09/21.
//

import UIKit

class CheckingAccount: UIView {


  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var accountTypeLabel: UILabel!
  @IBOutlet weak var amountLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
  }
  
  func initilize() {
    
  }
  
  func showAsUnSelected() {
    containerView.backgroundColor = UIColor(displayP3Red: 210/255, green: 228/255, blue: 250/255, alpha: 1)
    accountTypeLabel.textColor = .black
    amountLabel.textColor = .black
  }
  func showAsSelected() {
    self.backgroundColor = .clear
    containerView.backgroundColor = .clear //UIColor(displayP3Red: 210/255, green: 228/255, blue: 250/255, alpha: 1)
    accountTypeLabel.textColor = .white
    amountLabel.textColor = .white
  }

}
