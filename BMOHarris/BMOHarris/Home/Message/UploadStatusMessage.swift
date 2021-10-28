//
//  UploadStatusMessage.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

class UploadStatusMessage: UIView {

  @IBOutlet weak var backgroundView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var describtionLabel1: UILabel!
  @IBOutlet weak var describtionLabe2: UILabel!
  @IBOutlet weak var pageController: UIPageControl!
  
  func initilize() {
    backgroundView.layer.cornerRadius = 15
    
    self.pageController.numberOfPages = 5;
    self.pageController.currentPage = 2
    pageController.pageIndicatorTintColor = UIColor(hexString: "D8D8D8", alpha: 1)
    pageController.currentPageIndicatorTintColor = UIColor(hexString: "187ADC", alpha: 1)
  }

}
