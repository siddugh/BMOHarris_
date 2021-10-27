//
//  GoalCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import UIKit

class GoalCell: UICollectionViewCell, ConfigurableCell {
    
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var categoryBgView: UIView!
  
  @IBOutlet weak var instalmentsScrollView: UIScrollView!
  @IBOutlet weak var categoryLabel:UILabel!
  @IBOutlet weak var goalLabel:UILabel!
  @IBOutlet weak var nextPaymentLabel:UILabel!
  @IBOutlet weak var totalAmountLabel:UILabel!
  @IBOutlet weak var nextPayAmtLabel:UILabel!
  @IBOutlet weak var comletedOnLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      setupView()
    }
  
  
  func setupView() {
    categoryBgView.backgroundColor = .white
    categoryBgView.layer.cornerRadius = 10
    containerView.layer.cornerRadius = 11
    containerView.layer.cornerRadius = 11
    self.clipsToBounds = true
    
    addInstalmesView()
  }
  
  func addInstalmesView() {
    
    var x = 0
    for _ in 0..<15 {
      let frame = CGRect(x: x, y: 0, width: 15, height: 15)
      let optionView = OptionView(frame: frame)
      instalmentsScrollView.addSubview(optionView)
      x += 20
      optionView.selectView()
    }
  }
  
  
  func configure(_ item: GoalModel, indexPath: IndexPath) {
    
  }

}
