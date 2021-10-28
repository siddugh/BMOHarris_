//
//  BMOHeaderView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 16/04/21.
//

import UIKit

class BMOHeaderView: UIView {

  var headerImageView: UIImageView?
  
  override init(frame:CGRect) {
    super.init(frame: frame)
    addHeader()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func addHeader() {
    headerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 50))
    headerImageView?.image = UIImage(named: "bmclogo")
    if let headderView = headerImageView {
      self.addSubview(headderView)
      headerImageView?.translatesAutoresizingMaskIntoConstraints  = false
      headerImageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
      headerImageView?.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    }
  }
}
