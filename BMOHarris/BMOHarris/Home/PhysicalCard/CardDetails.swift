//
//  CardDetails.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 25/10/21.
//

import UIKit

class CardDetails: UIView {

  @IBOutlet weak var cardViewContainer: UIView!
  @IBOutlet weak var checkingAccNum: AccDetailInfoView!
  @IBOutlet weak var savingAccNum: AccDetailInfoView!
  @IBOutlet weak var routingNum: AccDetailInfoView!
  @IBOutlet weak var switchCode: AccDetailInfoView!

  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
  }
  
  func initilize() {
    addCardView()
    setAccountDetail()
  }
  
  func setAccountDetail() {
    checkingAccNum.initilize()
    savingAccNum.initilize()
    routingNum.initilize()
    switchCode.initilize()
  }
  
  func addCardView() {
    cardView = UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? CardView
    cardView.customSwitch.isHidden = true
    cardView.moreButton.isHidden = true
    cardViewContainer.addSubview(cardView)
    cardView.frame = cardViewContainer.bounds
  }


}
