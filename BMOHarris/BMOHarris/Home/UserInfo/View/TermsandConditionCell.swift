//
//  TermsandConditionCell.swift
//  BMO
//
//  Created by Siddu Hallikeri on 29/04/21.
//

import UIKit

class TermsandConditionCell: UITableViewCell {

  var termsConditonView: TermsandCondiView?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      self.backgroundColor =  .white
      setupUI()
    }

  func setupUI() {
    termsConditonView = Bundle.main.loadNibNamed("TermsandCondiView", owner: self, options: nil)!.first as? TermsandCondiView
    termsConditonView?.backgroundColor = .white
    if let v = termsConditonView {
      v.initilize()
      v.backgroundColor = .white
      self.addSubview(v)
      termsConditonView?.translatesAutoresizingMaskIntoConstraints  = false
     
      termsConditonView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
      termsConditonView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
      termsConditonView?.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
      termsConditonView?.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true

    }
  }
  
  static var identifier: String {
    return String(describing: self)
  }
  
  static var nib:UINib {
    return UINib(nibName: identifier, bundle: nil)
  }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
