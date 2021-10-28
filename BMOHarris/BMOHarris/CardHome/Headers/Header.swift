//
//  Header.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 22/09/21.
//

import UIKit

protocol HeaderDelegate: AnyObject {
  func backACtion()
}

class Header: UIView {

  @IBOutlet weak var gestureView: UIView!
  @IBOutlet weak var backButtonView: UIView!
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var imageBGView: UIView!
  weak var delegate: HeaderDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
  }

  func initilize() {
    setupView()
    addBackActiongesture()
    imageBGView.backgroundColor = .clear
    imageBGView.layer.cornerRadius = imageBGView.bounds.width / 2
    imageView.backgroundColor = .clear
    imageView.image = nil
  }
  
  func setupView() {
    backButtonView.layer.cornerRadius = backButtonView.bounds.width / 2
  }
  
  func addBackActiongesture() {
    gestureView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBackAction)))
  }
  
  @objc func handleBackAction() {
    delegate?.backACtion()
  }
  
  func addMenuButton() {
    backButton.setImage(UIImage(named: "menuLight"), for: .normal)
  }
  
}
