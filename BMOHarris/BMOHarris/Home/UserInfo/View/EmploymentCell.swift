//
//  EmploymentCell.swift
//  BMO
//
//  Created by Siddu Hallikeri on 29/04/21.
//

import UIKit

class EmploymentCell: UITableViewCell {

  var employmentInfoView: UserEmploymentInfo?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      setupUI()
    }

  func setupUI() {
    employmentInfoView = Bundle.main.loadNibNamed("UserEmploymentInfo", owner: self, options: nil)!.first as? UserEmploymentInfo

    if let v = employmentInfoView {
      v.initilize()
      v.backgroundColor = .white
      self.addSubview(v)
      employmentInfoView?.translatesAutoresizingMaskIntoConstraints  = false
     
      employmentInfoView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
      employmentInfoView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
      employmentInfoView?.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
      employmentInfoView?.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true

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
