//
//  DepositCell.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

class DepositCell: UITableViewCell {

  
  var depositAmountView: DepositAmountView!
  var goalSummaryView:GoalSummaryView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      self.backgroundColor = .white
      setupUI()
    }

  func setupUI() {
    depositAmountView = Bundle.main.loadNibNamed("DepositAmountView", owner: self, options: nil)!.first as? DepositAmountView
    depositAmountView.initilize()
    self.addSubview(depositAmountView)
    //reviewNewGoalVIew.frame = self.bounds
    depositAmountView.translatesAutoresizingMaskIntoConstraints = false
    
    depositAmountView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    depositAmountView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    depositAmountView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
    depositAmountView.heightAnchor.constraint(equalToConstant: 280).isActive = true
     
    
    goalSummaryView = Bundle.main.loadNibNamed("GoalSummaryView", owner: self, options: nil)!.first as? GoalSummaryView
    self.addSubview(goalSummaryView)
    goalSummaryView.initilize()
    goalSummaryView.addGoals()
    goalSummaryView.translatesAutoresizingMaskIntoConstraints = false
    
    goalSummaryView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
    goalSummaryView.topAnchor.constraint(equalTo: depositAmountView.bottomAnchor, constant: 10).isActive = true
    goalSummaryView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    goalSummaryView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
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
