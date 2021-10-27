//
//  AccDetailCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 25/10/21.
//

import UIKit

class AccDetailCell: UICollectionViewCell {
    
  var cardDetailsView: CardDetails?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  func setupUI() {
    cardDetailsView = Bundle.main.loadNibNamed("CardDetails", owner: self, options: nil)!.first as? CardDetails
    self.addSubview(cardDetailsView!)
    cardDetailsView?.frame  = self.bounds
    //accDetailView?.initilize()
  }

  
  static var identifier: String {
    return String(describing: self)
  }
  
  static var nib: UINib {
    return UINib(nibName: identifier, bundle: nil)
  }

  
  
}
