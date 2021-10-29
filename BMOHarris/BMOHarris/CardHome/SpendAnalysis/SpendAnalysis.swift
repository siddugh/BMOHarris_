//
//  SpendAnalysis.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 29/09/21.
//

import UIKit

protocol SelectedCategory: AnyObject {
  func selectedCatogry(cattagory: SpendCategoryType)
}

enum SpendCategoryType {
  case kClothing
  case kDiining
  case kUtility
  case kGrocery
  case kFoodDrink
}

struct Cateogory {
  let category: String
  let color: String
  let type: SpendCategoryType
  let percentage: Double
  let amount: String
}


class SpendCategoryView: UIView {
  
  var amountLabel: UILabel!
  var percentageLabel: UILabel!
  var categoryFrame: CGRect = .zero
  var type: SpendCategoryType = SpendCategoryType.kClothing
  
  weak var delegate: SelectedCategory?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.categoryFrame = frame
    setUpView()
    self.layer.cornerRadius  = 4
    addGesture(toView: self)
  }
  
  convenience init(frame: CGRect, category: SpendCategoryType) {
    self.init(frame: frame)
    self.type = category
    
  }
    
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  //Mark: - Private functions
  private func setUpView() {
    amountLabel = UILabel()
    self.addSubview(amountLabel)
    amountLabel.frame = CGRect(x: 5, y: categoryFrame.height / 2 - 15 , width: categoryFrame.width, height: 15)
    amountLabel.textColor = .white
    amountLabel.font = UIFont(name: "Rubik Regular", size: 9)
    
    percentageLabel = UILabel()
    self.addSubview(percentageLabel)
    percentageLabel.frame = CGRect(x: 5, y: self.bounds.height / 2 , width: categoryFrame.width, height: 15)
    percentageLabel.textColor = .white
    percentageLabel.font = UIFont(name: "Rubik Medium", size: 10)
  }
  
  //Mark: - Public functions
  
  func decorateView(price: String, percentage: String, color: UIColor) {
    amountLabel.text = ""
    amountLabel.text = price
   percentageLabel.text = percentage
    self.backgroundColor = color
  }
  
  private func addGesture(toView: UIView) {
    toView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
  }
  
  @objc private func handleTapGesture() {
    delegate?.selectedCatogry(cattagory: self.type)
  }

}


protocol SpendAnalysisDelegate: AnyObject {
  func showTransactionListOf(category: SpendCategoryType)
}

class SpendAnalysis: UIView {

  var categories: [Cateogory] = [Cateogory]()
  var type: SpendCategoryType = SpendCategoryType.kClothing
  weak var delegate: SelectedCategory?
  
  var spendCategoryView: [SpendCategoryView] = [SpendCategoryView]()
  var categoryViews: [CategoryView] = [CategoryView]()
  
  weak var transDelegate: SpendAnalysisDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience init(frame: CGRect, catagories: [Cateogory]) {
    self.init(frame: frame)
    self.categories = catagories
    show()
    //addGesture(toView: self)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func show() {
    //setupView()
    self.perform(#selector(setupView), with: nil, afterDelay: 0.1)
    self.backgroundColor = .white
  }
  
  @objc private func setupView() {
    
//    let stackView = UIStackView()
//    self.addSubview(stackView)
//    stackView.alignment = .leading
//    stackView.distribution = .equalSpacing
//    //stackView.spacing = 5
//
//    stackView.translatesAutoresizingMaskIntoConstraints = false
//    stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
//    stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60).isActive = true
//    stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
//    stackView.backgroundColor = .green
    
    let totalNumberOfCategories = 5
    let padding = 10
    let totalpadding = (totalNumberOfCategories - 1) * padding
    let totalWidth = self.bounds.width
    print("totalWidth: \(totalWidth)")
    let totalSpaceToDraw = Int(totalWidth) - totalpadding
    
    let cagagories = [Cateogory(category: "Clothing", color: "76BFD5", type: .kClothing, percentage: 13, amount: "$129"),
                      Cateogory(category: "Dining", color: "70C25A", type: .kDiining, percentage: 21, amount: "$347"),
                      Cateogory(category: "Utility", color: "9A7EC5", type: .kUtility, percentage: 6, amount: "$82"),
                      Cateogory(category: "Groceries", color: "CD6464", type: .kGrocery, percentage: 48, amount: "$770"),
                      Cateogory(category: "Food & Drink", color: "E5966A", type: .kFoodDrink, percentage: 12, amount: "$104")]
    
    var xPos: Int = 0
    var catXPos: CGFloat = 0
    for i in  0..<cagagories.count {
      let catagory = cagagories[i]
      var catViewWidth = (totalSpaceToDraw * Int(catagory.percentage)) / 100
      if catViewWidth < 25 {
        catViewWidth = 25
      }
      if catViewWidth > 100 {
        catViewWidth = 100
      }
      let frm = CGRect(x: xPos, y: 0, width: catViewWidth, height: 57)
      let catView = SpendCategoryView(frame: frm,category: catagory.type)
      catView.delegate = self
      var percentage = "%"
      
       let percent = Int(catagory.percentage)
      if percent != nil {
        percentage = String(percent) + "%"
      }
      catView.decorateView(price: catagory.amount, percentage: percentage, color: UIColor(hexString: catagory.color))
      self.addSubview(catView)
      print("catView Frame: \(catView.frame)")
      
      let catFrame = CGRect(x: catXPos, y: frm.origin.y + 70, width: 50, height: 20)
      let categoryView = CategoryView(frame: catFrame, type: catagory.type)
      //stackView.addArrangedSubview(categoryView)
      self.addSubview(categoryView)
      categoryView.setCategory(color: UIColor(hexString: catagory.color), txt: catagory.category)
      categoryView.delegate = self
      xPos += catViewWidth + 15
      catXPos += 60
      
      spendCategoryView.append(catView)
      categoryViews.append(categoryView)
    }
  }
  
  func showCategory(category: SpendCategoryType) {
    
    spendCategoryView.forEach { categoryView in
      if categoryView.type != category {
        UIView.animate(withDuration: 0.5) {
          categoryView.alpha = 0.5
        }
      } else {
        UIView.animate(withDuration: 0.5) {
          categoryView.alpha = 1
        }
      }
    }
    categoryViews.forEach { categoryView in
      if categoryView.type != category {
        UIView.animate(withDuration: 0.5) {
          categoryView.alpha = 0.5
        }
      } else {
        UIView.animate(withDuration: 0.5) {
          categoryView.alpha = 1
        }
      }
    }

  }
  
  func showAll() {
    spendCategoryView.forEach { categoryView in
      UIView.animate(withDuration: 0.4) {
        categoryView.alpha = 1
      }
    }
    categoryViews.forEach { categoryView in
      UIView.animate(withDuration: 0.4) {
        categoryView.alpha = 1
      }
    }
  }
}

extension SpendAnalysis: SelectedCategory {
  func selectedCatogry(cattagory: SpendCategoryType) {
    print("Selected Category.... \(cattagory)")
    showCategory(category: cattagory)
    transDelegate?.showTransactionListOf(category: cattagory)
  }
}
