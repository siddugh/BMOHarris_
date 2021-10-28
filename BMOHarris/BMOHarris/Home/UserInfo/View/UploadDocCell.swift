//
//  UploadDocCell.swift
//  BMO
//
//  Created by Siddu Hallikeri on 19/04/21.
//

import UIKit

class UploadDocCell: UITableViewCell {

  var identityProofView: IdentityProofView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      identityProofView = Bundle.main.loadNibNamed("IdentityProofView", owner: self, options: nil)!.first as? IdentityProofView
     
     if let v = identityProofView {
       v.initilize()
       v.backgroundColor = .white
       self.addSubview(v)
      identityProofView?.translatesAutoresizingMaskIntoConstraints  = false
      
      identityProofView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
      identityProofView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
      identityProofView?.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
      identityProofView?.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true

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
