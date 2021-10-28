//
//  FBCustomSwitch.swift
//  CustumSwitch
//
//  Created by Siddu Hallikeri on 30/06/21.
//

import UIKit

class NobView: UIView {
  
  var immageView =  UIImageView()
  
  @objc func initilize() {
    self.addSubview(immageView)
    self.clipsToBounds = true
    immageView.translatesAutoresizingMaskIntoConstraints = false
    immageView.contentMode = .scaleAspectFit
    immageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    immageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    immageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
    immageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
  }
  
  func addNobImage(image: UIImage?) {
    guard let nobimage = image else { return }
    immageView.image = nobimage
  }
  func setbackgroundColour(color: UIColor) {
    self.backgroundColor = color
  }

}





protocol FBCustomSwitchDelegate: AnyObject {
  func switchAction()
  func onSwitchActionCompletion()
}

@IBDesignable class FBCustomSwitch: UIView {
   
  @IBInspectable var nobLockedImage: UIImage?
  @IBInspectable var nobUnLockedImage: UIImage?
  @IBInspectable var lockedImage: UIImage?
  @IBInspectable var unLockedImage: UIImage?

  @IBInspectable var containerColor: UIColor?
  
  @IBInspectable var nobLockedColor: UIColor?
  @IBInspectable var nobUnLockedColor: UIColor?
  @IBInspectable var lockedColor: UIColor?
  @IBInspectable var unLockedColor: UIColor?
      
  private var containerView = UIView()
  private var nobView = NobView()
  private var lockedImageView = UIImageView()
  private var unLockedImageView = UIImageView()
  
  
  private var nobViewLeadingConstraint: NSLayoutConstraint!
  private var cornerReadius: CGFloat = 25
  
  weak var delegate: FBCustomSwitchDelegate?
  
  var isLocked = true
  
  
   
  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
    addLockedAndUnlockedImage()
    
    initilizeNobView()
    setCornorRadius(cornerRadius: 10)
    //setDefaultColors()
    setContainerBackgroundColor(bgColor: containerColor)
  }
  
//  init() {
//    super.init(frame: .zero)
//    self.perform(#selector(delayedSetUP), with: nil, afterDelay: 0.1)
//  }
  
  func setUpView() {
    self.perform(#selector(delayedSetUP), with: nil, afterDelay: 0.1)
  }
  
  @objc func delayedSetUP() {
    initilize()
    addLockedAndUnlockedImage()
    initilizeNobView()
    setCornorRadius(cornerRadius: 10)
    setDefaultColors()
    setContainerBackgroundColor(bgColor: containerColor)
  }
  
  @objc func initilizeNobView() {
    containerView.addSubview(nobView)
    nobView.translatesAutoresizingMaskIntoConstraints = false
    
    nobViewLeadingConstraint = nobView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
    nobViewLeadingConstraint.isActive = true
    nobView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    nobView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    nobView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0).isActive = true
    
    nobView.initilize()
    initilizeNobWithImages()
    addTapGesture()
    
    self.perform(#selector(initilizeNobb), with: nil, afterDelay: 0.1)
  }
  
  private func initilizeNobWithImages() {
    setNobLockedImage()
  }
  
  
  private func setNobLockedImage() {
    if isLocked {
      nobView.addNobImage(image: nobLockedImage)
    } else {
      nobView.addNobImage(image: nobUnLockedImage)
    }
    switchActionWithoughtAnimation()
    
  }
  
  private func initilizeNobWithColour() {
    
    if let noblockedcolor = nobLockedColor {
      setnobLockedBgColr(color: noblockedcolor)
    }
  }
    
  private func setnobLockedBgColr(color: UIColor) {
    nobView.setbackgroundColour(color: color)
  }

  private func setnobUnLockedBgColr(color: UIColor) {
    nobView.setbackgroundColour(color: color)
  }

  
  private func initilize() {
    self.addSubview(containerView)
    containerView.frame = self.bounds
    containerView.clipsToBounds = true
  }
  
  private func addLockedAndUnlockedImage() {
    containerView.addSubview(lockedImageView)
    containerView.addSubview(unLockedImageView)
    
    lockedImageView.translatesAutoresizingMaskIntoConstraints = false
    lockedImageView.contentMode = .scaleAspectFit
    
    lockedImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.25).isActive = true
    lockedImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
    lockedImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: (containerView.bounds.width / 4 -  containerView.bounds.width / 7) ).isActive = true
    lockedImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
    lockedImageView.backgroundColor = .systemOrange
    
    unLockedImageView.translatesAutoresizingMaskIntoConstraints = false
    unLockedImageView.contentMode = .scaleAspectFit
    
    unLockedImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.25).isActive = true
    unLockedImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
    unLockedImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -(containerView.bounds.width / 4 -  containerView.bounds.width / 7) ).isActive = true
    unLockedImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
    unLockedImageView.backgroundColor = .systemOrange
    
    
    
    if let image = unLockedImage {
      unLockedImageView.image = image
      unLockedImageView.backgroundColor = .clear
    }

    if let image = lockedImage {
      lockedImageView.image = image
      lockedImageView.backgroundColor = .clear
    }

  }
  
  @objc private func initilizeNobb() {
    nobView.layer.cornerRadius =  nobView.bounds.height / 2
    nobView.clipsToBounds = true
  }
    
  private func addTapGesture() {
    self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
  }
  
  @objc private func handleTapGesture() {
    delegate?.switchAction()
  }
  
  func updateSwitch() {
    let leadingConstant = isLocked ? 0 : self.bounds.width / 2
    self.nobViewLeadingConstraint.constant = leadingConstant
    if isLocked {
      nobView.addNobImage(image: nobLockedImage)
    } else {
      nobView.addNobImage(image: nobUnLockedImage)
    }
    self.isLocked ? self.setNobLockedColor(nobColor: self.nobLockedColor) : self.setNobUnLockedColor(nobColor: self.nobUnLockedColor) 
  }
  
  private func setBackGroundColor(bgColor: UIColor?, bgView: UIView) {
    guard let color = bgColor else { return }
    
    UIView.animate(withDuration: 0.4) {
      bgView.backgroundColor = color
    }
  }
  
  func switchAction() {
    let leadingConstant = isLocked ? self.bounds.width / 2: 0
    let animator = UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.8) {
      self.nobViewLeadingConstraint.constant = leadingConstant
      self.layoutIfNeeded()
      
      self.isLocked ? self.setNobUnLockedColor(nobColor: self.nobUnLockedColor) : self.setNobLockedColor(nobColor: self.nobLockedColor)
      
      
      self.isLocked ? self.setNobUnLockedImage(nobImage: self.nobUnLockedImage) :
        self.setNobUnLockedImage(nobImage: self.nobLockedImage)
      
    }
    animator.addCompletion { _ in
      self.isLocked = !self.isLocked
      self.delegate?.onSwitchActionCompletion()
    }
    animator.startAnimation()
  }
  
  func switchActionWithoughtAnimation() {
    
    if self.nobViewLeadingConstraint != nil {
      let leadingConstant = isLocked ? 0 : self.bounds.width / 2
      self.nobViewLeadingConstraint.constant = leadingConstant
      self.layoutIfNeeded()
      self.isLocked ?  self.setNobLockedColor(nobColor: self.nobLockedColor) : self.setNobUnLockedColor(nobColor: self.nobUnLockedColor)
      self.isLocked ? self.setNobUnLockedImage(nobImage: self.nobLockedImage) : self.setNobUnLockedImage(nobImage: self.nobUnLockedImage)
    }
  }
  
  func setContainerBackgroundColor(bgColor: UIColor?) {
    self.containerColor = bgColor
    //containerView.backgroundColor = self.containerColor
    setBackGroundColor(bgColor: containerColor, bgView: containerView)
  }
  
  // Mark: - Set Images
  func setNobLockedImage(nobImage: UIImage) {
    self.nobLockedImage = self.lockedImage
    self.nobView.immageView.image = self.nobLockedImage
  }
  
  func setNobUnLockedImage(nobImage: UIImage?) {
    guard let image = nobImage else  { return }
    
    self.nobView.immageView.image = image
  }

  func setNobLockedImage(nobImage: UIImage?) {
    guard let image = nobImage else  { return }
    self.nobView.immageView.image = image
  }

  func setLockedImage(lockedImage: UIImage?) {
    self.lockedImage = lockedImage
    self.lockedImageView.image = self.lockedImage
  }
  
    
  func setUnLockedImage(unloackedImage: UIImage?) {
    self.unLockedImage = unloackedImage
    self.unLockedImageView.image = self.unLockedImage
  }

  func setImages(nobLockedImage: UIImage?, nobUnLockedImage: UIImage?, lockedImage: UIImage?, unLockedImage: UIImage?) {
    self.nobLockedImage = nobLockedImage
    self.nobUnLockedImage = nobUnLockedImage
    self.lockedImage = lockedImage
    self.unLockedImage = unLockedImage
  }

  // Mark: - Set Colors    
  func setBackgroundColors(noblockedColor: UIColor?,nobUnlockedColor: UIColor?, lockedColor: UIColor?, unLockedColor: UIColor?) {
    setLockedColor(lockedColor: lockedColor)
    setUnLockedColor(unLOckedColor: unLockedColor)
    setNobLockedColor(nobColor: noblockedColor)
    setNobUnLockedColor(nobColor: unLockedColor)
  }
  
  func setNobLockedColor(nobColor: UIColor?) {
    //self.nobLockedColor = nobColor
    self.nobView.backgroundColor = nobColor //self.nobLockedColor
  }
  func setNobUnLockedColor(nobColor: UIColor?) {
    //self.nobUnLockedColor = nobColor
    self.nobView.backgroundColor = nobColor
    //setBackGroundColor(bgColor: nobColor, bgView: nobView)
  }
  
  
  func setLockedColor(lockedColor: UIColor?) {
    //self.lockedColor = lockedColor
    //self.lockedImageView.backgroundColor = self.lockedColor
    setBackGroundColor(bgColor: lockedColor, bgView: lockedImageView)
  }
  
  
  func setUnLockedColor(unLOckedColor: UIColor?) {
    self.unLockedColor = unLOckedColor
    //self.unLockedImageView.backgroundColor = self.unLockedColor
    setBackGroundColor(bgColor: unLockedColor, bgView: unLockedImageView)
  }
    
  func setCornorRadius(cornerRadius: Double) {
    self.cornerReadius = CGFloat(cornerRadius)
    self.perform(#selector(setContainerViewCornerRadius), with: nil, afterDelay: 0.1)
  }
  
  @objc func setContainerViewCornerRadius() {
    containerView.layer.cornerRadius = self.cornerReadius
  }
  
  
    
  func resetAllResource() {
    
    self.nobLockedColor = .clear
    self.nobUnLockedColor = .clear
    
    self.nobLockedImage = nil
    self.nobUnLockedImage = nil
    
    self.lockedColor = .clear
    self.unLockedColor = .clear
    
    self.lockedImage = nil
    self.unLockedImage = nil
  }
  
  func setDefaultColors() {
    
//    self.nobLockedColor = .systemOrange
//    self.nobUnLockedColor = .systemOrange
//
//    self.nobLockedImage = nil
//    self.nobUnLockedImage = nil
//
//    self.lockedColor = .systemOrange
//    self.unLockedColor = .systemOrange
    
    self.lockedImage = nil
    self.unLockedImage = nil
    
//    if self.containerColor == nil {
//      self.containerColor = .systemTeal
//    }
    
    
    containerColor = UIColor(hexString: "EDEDED")
    nobLockedColor = UIColor(hexString: "53C984")
    nobLockedColor = UIColor(hexString: "53C984")
    nobUnLockedColor = UIColor(hexString: "53C984")

    
    
//    lockedColor = .systemOrange
//    unLockedColor = .systemOrange
//
//    nobLockedColor = .systemGreen
//    nobUnLockedColor = .systemRed
//
//    nobView.immageView.backgroundColor = .yellow
    
    setLockedColor(lockedColor: lockedColor)
    setUnLockedColor(unLOckedColor: unLockedColor)
    setNobLockedColor(nobColor: nobLockedColor)
    setContainerBackgroundColor(bgColor: containerColor)
    unLockedImageView.backgroundColor = .clear
    lockedImageView.backgroundColor = .clear

  }
}
