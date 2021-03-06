//
//  NewGoalView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 01/10/21.
//

import UIKit

protocol NewGoalViewDelegate: AnyObject {
  func reviewNewGoal()
}

class NewGoalView: UIView {

  
  @IBOutlet weak var txtLabel: UILabel!
  @IBOutlet weak var txtBgView: UIView!
  @IBOutlet weak var savingAmountLabel: UILabel!
  @IBOutlet weak var savingAmtBgView: UIView!
  @IBOutlet weak var monthLabelBgView: UIView!
  @IBOutlet weak var reviewButton: UIButton!
  
  @IBOutlet weak var goalView: UIView!
  @IBOutlet weak var scaleView: ScaleViewContainer!
  weak var delegate: NewGoalViewDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
   // initilize()
    self.perform(#selector(initilize), with: nil, afterDelay: 0.1)
  }
  
  @objc private func initilize() {
    //txtLabel.text = "Your emergency fund should be at least \n3 to 6 times your monthly espenses."
    txtBgView.layer.cornerRadius = 20
    savingAmtBgView.layer.cornerRadius = 15
    monthLabelBgView.layer.cornerRadius = 15
    reviewButton.layer.cornerRadius = 24
    scaleView.delegate = self
    addNewGoalViewController()
  }
  
  func addNewGoalViewController() {
    var newgoals = [NewGoalModel]()
    newgoals.append(NewGoalModel(image: "customgoal1", title: ""))
    newgoals.append(NewGoalModel(image: "emergencyfund1", title: ""))
    newgoals.append(NewGoalModel(image: "vacationgoal1", title: ""))    
    let newGoalViewModel = GoalsViewModel(newgoalmodel: newgoals)
    //let newgoalsview = NewGoalListView(frame: goalView.frame)
    let newgoalsview = NewGoalListView(frame: goalView.frame,viewModel: newGoalViewModel)
    goalView.addSubview(newgoalsview)
    newgoalsview.frame = goalView.bounds
    
    newgoalsview.collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: true)
  }
    
    
  //Mark: - Action functions
  @IBAction func reviewButtonAction(_ sender: Any) {
    
    delegate?.reviewNewGoal()
  }
}

extension NewGoalView: ScaleViewContainerDelegate {
  func scaleValue(value: Int) {
    
    self.savingAmountLabel.text = "$"+String(value)
  }
}
