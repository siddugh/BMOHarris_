//
//  GoalsViewModel.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import UIKit

class GoalsViewModel {
  
  var newGoals: [NewGoalModel]?

  init(newgoalmodel: [NewGoalModel]) {
    self.newGoals = newgoalmodel
  }
  
  var goals: [GoalModel]?
  
  init(goals: [GoalModel]) {
    self.goals = goals
  }

}
