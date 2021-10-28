//
//  PersonalInfoCell.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

class PersonalInfoCell: UITableViewCell {

  var personalInfoView: PersonalInfoView?
    override func awakeFromNib() {
        super.awakeFromNib()
      personalInfoView = Bundle.main.loadNibNamed("PersonalInfoView", owner: self, options: nil)!.first as? PersonalInfoView
     
     if let v = personalInfoView {
       v.initilize()
       v.backgroundColor = .white
       self.addSubview(v)
       v.frame = self.bounds
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
