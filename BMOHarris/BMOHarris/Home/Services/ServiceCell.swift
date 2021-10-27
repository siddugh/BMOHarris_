//
//  ServiceCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 24/09/21.
//

import UIKit

class ServiceCell: UICollectionViewCell, ConfigurableCell {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var imageBGView: UIView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var serviceLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
  
  private func setUp() {
    containerView.backgroundColor = .clear
    imageBGView.layer.cornerRadius = 16
  }
  
  // MARK: - COnfigurableCell
  func configure(_ item: ServiceViewModel, indexPath: IndexPath) {
    var opacity: Double = 1.0
    if let hexColor = item.service[indexPath.item].bgColour {
      if let colorOpacity = item.service[indexPath.item].colorOpacity {
        opacity = colorOpacity
      }
      let color = UIColor(hexString: hexColor, alpha: 1.0)
      serviceLabel.text = item.service[indexPath.item].service
      serviceLabel.textColor = color
      imageBGView.backgroundColor = UIColor(hexString: hexColor, alpha: CGFloat(opacity))
      if let img = item.service[indexPath.item].image {
        imageView.image = UIImage(named: img)
      }
    }
  }
}
