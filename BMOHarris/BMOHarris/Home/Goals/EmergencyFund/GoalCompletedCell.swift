//
//  GoalCompletedCell.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

class GoalCompletedCell: UITableViewCell {

  
    var completedGoalView: CompletedGoalView!
    var goalSummaryView:GoalSummaryView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      setupUI()
    }

  func setupUI() {
    completedGoalView = Bundle.main.loadNibNamed("CompletedGoalView", owner: self, options: nil)!.first as? CompletedGoalView
    completedGoalView.initilize()
    self.addSubview(completedGoalView)
    completedGoalView.translatesAutoresizingMaskIntoConstraints = false
    
    completedGoalView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    completedGoalView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    completedGoalView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    completedGoalView.heightAnchor.constraint(equalToConstant: 140).isActive = true

    
    goalSummaryView = Bundle.main.loadNibNamed("GoalSummaryView", owner: self, options: nil)!.first as? GoalSummaryView
    self.addSubview(goalSummaryView)
    goalSummaryView.initilize()
    goalSummaryView.addGoals2()
    goalSummaryView.translatesAutoresizingMaskIntoConstraints = false
    
    goalSummaryView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
    goalSummaryView.topAnchor.constraint(equalTo: completedGoalView.bottomAnchor, constant: 10).isActive = true
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
