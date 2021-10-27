//
//  GoalSummaryCell.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

class GoalSummaryCell: UITableViewCell {

  @IBOutlet weak var goalImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var totalGrayView: UIView!
  @IBOutlet weak var completedGreenView: UIView!
  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var completedViewWIdthConstraint: NSLayoutConstraint!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      totalGrayView.layer.cornerRadius = 4
      completedGreenView.layer.cornerRadius = 4
    }

  func configure4Cell(data:DepositGoalModel) {
    
    goalImageView.image = UIImage(named: data.goalImage)
    titleLabel.text = data.title
    amountLabel.text = data.amount
    completedViewWIdthConstraint.constant = CGFloat(data.completedPercentage)
    
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
