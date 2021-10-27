//
//  SpendAnalysis.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 29/09/21.
//

import UIKit

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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.categoryFrame = frame
    setUpView()
    self.layer.cornerRadius  = 4
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
}


class SpendAnalysis: UIView {

  var categories: [Cateogory] = [Cateogory]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience init(frame: CGRect, catagories: [Cateogory]) {
    self.init(frame: frame)
    self.categories = catagories
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
    
    let stackView = UIStackView()
    self.addSubview(stackView)
    stackView.alignment = .leading
    stackView.distribution = .equalSpacing
    //stackView.spacing = 5
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60).isActive = true
    stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true

    
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
    for i in  0..<cagagories.count {
      let catagory = cagagories[i]
      let catViewWidth = (totalSpaceToDraw * Int(catagory.percentage)) / 100
      let frm = CGRect(x: xPos, y: 0, width: catViewWidth, height: 57)
      
      let catView = SpendCategoryView(frame: frm)
      var percentage = "%"
      
       let percent = Int(catagory.percentage)
      if percent != nil {
        percentage = String(percent) + "%"
      }
      catView.decorateView(price: catagory.amount, percentage: percentage, color: UIColor(hexString: catagory.color))
      self.addSubview(catView)
      print("catView Frame: \(catView.frame)")
      
      let catFrame = CGRect(x: frm.origin.x, y: frm.origin.y + 58, width: frm.size.width, height: 20)
      let categoryView = CategoryView(frame: .zero)
      stackView.addArrangedSubview(categoryView)
      categoryView.setCategory(color: UIColor(hexString: catagory.color), txt: catagory.category)
      
      xPos += catViewWidth + 10
    }
    
    
    
//
//
//    let clothingCatWidth = (totalSpaceToDraw * 13) / 100
//    let frm = CGRect(x: 0, y: 0, width: clothingCatWidth, height: 57)
//    let clothingView = SpendCategoryView(frame: frm)
//    clothingView.decorateView(price: "$129", percentage: "13%", color: UIColor(hexString: "76BFD5"))
//
//    self.addSubview(clothingView)
//
//
//
//    let diningCatWidth = (totalSpaceToDraw * 21) / 100
//    let diningView = UIView()
//    diningView.backgroundColor = UIColor(hexString: "70C25A")
//    self.addSubview(diningView)
//    diningView.frame = CGRect(x: clothingCatWidth + 10, y: 0, width: diningCatWidth, height: 57)
//
//
//
//    let utilityCatWidth = (totalSpaceToDraw * 6) / 100
//    let uitilityView = UIView()
//    uitilityView.backgroundColor = UIColor(hexString: "9A7EC5")
//    self.addSubview(uitilityView)
//    uitilityView.frame = CGRect(x: Int(diningView.frame.origin.x + diningView.frame.width) + 10, y: 0, width: utilityCatWidth, height: 57)
//
//    let groceryCatWidth = (totalSpaceToDraw * 48) / 100
//    let groceryView = UIView()
//    groceryView.backgroundColor = UIColor(hexString: "CD6464")
//    self.addSubview(groceryView)
//    groceryView.frame = CGRect(x: Int(uitilityView.frame.origin.x + uitilityView.frame.width) + 10, y: 0, width: groceryCatWidth, height: 57)
//
//    let fdCatWidth = (totalSpaceToDraw * 12) / 100
//    let fdView = UIView()
//    fdView.backgroundColor = UIColor(hexString: "E5966A")
//    self.addSubview(fdView)
//    fdView.frame = CGRect(x: Int(groceryView.frame.origin.x + groceryView.frame.width) + 10, y: 0, width: fdCatWidth, height: 57)

  }
  
}
