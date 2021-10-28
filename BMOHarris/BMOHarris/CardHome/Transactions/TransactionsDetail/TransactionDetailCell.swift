//
//  TransactionDetailCell.swift
//  BMO
//
//  Created by Siddu Hallikeri on 05/05/21.
//

import UIKit

class TransactionDetailCell: UITableViewCell {

  var detailView: TransactiosDetailVIew!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      setupUI()
    }
  
  func setupUI() {
    detailView = Bundle.main.loadNibNamed("TransactiosDetailVIew", owner: self, options: nil)!.first as? TransactiosDetailVIew
    
    self.addSubview(detailView)
    detailView.translatesAutoresizingMaskIntoConstraints = false
    detailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    detailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    detailView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    detailView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true


  }

  static var identifier: String {
    return String(describing: self)
  }
  
  static var nib: UINib {
    return UINib(nibName: identifier, bundle: nil)
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
