//
//  GoalSummaryView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

class GoalSummaryView: UIView {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var viewALlButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  
  var goals:[DepositGoalModel] = [DepositGoalModel]()
  
  func initilize() {
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.register(GoalSummaryCell.nib, forCellReuseIdentifier: GoalSummaryCell.identifier)
    tableView.separatorStyle = .none
    tableView.backgroundColor = .white
    

  }
  
  func addGoals() {
    goals.append(DepositGoalModel(goalImage: "recurring", totalViewColor: "", completedViewColor: "", title: "Recurring transfer", amount: "$0",completedPercentage:5))
    goals.append(DepositGoalModel(goalImage: "manualdeposit", totalViewColor: "", completedViewColor: "", title: "Manual deposit", amount: "+$0",completedPercentage:10))
    tableView.reloadData()
  }
  
  func addGoals2() {
    goals.append(DepositGoalModel(goalImage: "recurring", totalViewColor: "", completedViewColor: "", title: "Recurring transfer", amount: "$100",completedPercentage:80))
    goals.append(DepositGoalModel(goalImage: "manualdeposit", totalViewColor: "", completedViewColor: "", title: "Manual deposit", amount: "+$10",completedPercentage:18))
    
    goals.append(DepositGoalModel(goalImage: "roundup", totalViewColor: "", completedViewColor: "", title: "Round-up savings", amount: "+$5",completedPercentage:8))
    tableView.reloadData()
  }


  @IBAction func viewAllButtonAction(_ sender: Any) {
    
  }
}

extension GoalSummaryView: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return goals.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: GoalSummaryCell.identifier, for: indexPath) as!
      GoalSummaryCell
    cell.selectionStyle = .none
    cell.configure4Cell(data: goals[indexPath.row])
    
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

}
