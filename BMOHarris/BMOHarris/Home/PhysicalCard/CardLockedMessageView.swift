//
//  CardLockedMessageView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 29/09/21.
//

import UIKit

protocol CardLockedMessageViewDelegate: AnyObject {
  func tappedOnMessageView()
}

class CardLockedMessageView: UIView {

  @IBOutlet weak var containerView: UIView!
  var delegate: CardLockedMessageViewDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
  }
  
  private func initilize() {
    containerView.layer.cornerRadius = 10
    addTapGesture()
  }
  
  private func addTapGesture() {
    containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
  }
  
  @objc func handleTapGesture() {
    delegate?.tappedOnMessageView()
  }
  
}
