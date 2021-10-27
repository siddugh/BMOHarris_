//
//  VIewFactory.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 20/10/21.
//

import UIKit


class ViewFactory {
  
  func getHeaderViewWithMenuButton() -> Header {
    let headerView = UINib(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil).first as! Header
    headerView.addMenuButton()
    return headerView
  }

  func getTransDetailHeader() -> Header {
    let headerView = UINib(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil).first as! Header
    headerView.titleLabel.text = "Transactions"
    headerView.titleLabel.font =  UIFont(name: "Rubik-Medium", size: 12)
    return headerView
  }

  func getHeaderViewWithbackButton() -> Header {
    let headerView = UINib(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil).first as! Header    
    return headerView
  }

  func getAccountCardServiceHeaderView() -> Header {
    let headerView = UINib(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil).first as! Header
    headerView.titleLabel.text = "Account & Card"
    headerView.titleLabel.font =  UIFont(name: "Rubik-Medium", size: 12)
    headerView.titleLabel.textColor = UIColor(hexString: "B25DB9",alpha: 1.0)
    headerView.imageBGView.backgroundColor = UIColor(hexString: "B25DB9", alpha: 0.2)
    headerView.imageView.image = UIImage(named: "creditcard")

    
    return headerView
  }

  func getCardLockedMessageView() -> CardLockedMessageView {
    let cardLockedMessageView = UINib(nibName: "CardLockedMessageView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! CardLockedMessageView
    cardLockedMessageView.clipsToBounds = true
    return cardLockedMessageView
  }
  
  func getCardView() -> CardView {
    let cardView = UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! CardView
    return cardView

  }

  func getSavingGoalHeaderView() -> Header {
    let headerView = UINib(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil).first as! Header
    headerView.titleLabel.text = "Savings Goals"
    headerView.titleLabel.font =  UIFont(name: "Rubik-Medium", size: 12)
    headerView.titleLabel.textColor = UIColor(hexString: "4D31BE",alpha: 1.0)

    return headerView
  }
}
