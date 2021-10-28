//
//  ScaleView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

protocol ScaleViewFelegate:class {
  func scrollingValue(scrolVal:Double)
}

class ScaleView: UIView {

  weak var delegate: ScaleViewFelegate?
  let pointColor = UIColor(hexString: "D8D8D8")
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    //initilize()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    //initilize()
  }
  
  func initilize() {
    addScale()
  }
  
  @objc func addScale() {
    
    var xPos: CGFloat = 30
    for i in 0..<30 {
      
      if i % 5 == 0 {
        let startPoint = getStatPoint()
        startPoint.frame.origin.x = xPos
        startPoint.frame.origin.y = 5
        self.addSubview(startPoint)
      } else {
        let midPOint = getMidPoint()
        midPOint.frame.origin.x = xPos
        midPOint.frame.origin.y = 15
        self.addSubview(midPOint)
      }
      
      
      xPos += 20
    }
  }
  
  func getStatPoint() -> UILabel {
    
    let startLabel = UILabel()
    startLabel.backgroundColor = pointColor
    startLabel.layer.cornerRadius = 5
    startLabel.frame = CGRect(x: 0, y: 0, width: 2, height: 30)
    
    return startLabel
  }

  func getMidPoint() -> UILabel {
    
    let midLabel = UILabel()
    midLabel.backgroundColor = pointColor
    midLabel.layer.cornerRadius = 5
    midLabel.frame = CGRect(x: 0, y: 0, width: 2, height: 10)
    
    return midLabel
  }

}
