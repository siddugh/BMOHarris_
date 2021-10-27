//
//  CouponsView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 21/10/21.
//

import UIKit

class CouponsView: UIView {

  var couponViewModel: CouponViewModel?
  var couponsCollectionView: CouponCollectionView!
  
  let viewAllButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  convenience init(couponViewModel: CouponViewModel) {
    self.init()
    self.couponViewModel = couponViewModel
    addView()
    self.backgroundColor = .white
  }

  private func addView() {
    
    let labelBGView = UIView()
    self.addSubview(labelBGView)
    labelBGView.backgroundColor = UIColor(hexString: "E2E2E2")
    labelBGView.translatesAutoresizingMaskIntoConstraints = false
    labelBGView.layer.cornerRadius = 14
    
    labelBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    labelBGView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    labelBGView.widthAnchor.constraint(equalToConstant: 110).isActive = true
    labelBGView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    let imageView = UIImageView()
    imageView.image = UIImage(named: "coupons")
    labelBGView.addSubview(imageView)
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.leadingAnchor.constraint(equalTo: labelBGView.leadingAnchor, constant: 15).isActive = true
    imageView.centerYAnchor.constraint(equalTo: labelBGView.centerYAnchor, constant: 0).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
    imageView.backgroundColor = .clear
    
    
    let label = UILabel()
    labelBGView.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.centerYAnchor.constraint(equalTo: labelBGView.centerYAnchor, constant: 0).isActive = true
    label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
    label.text = "Coupons"
    label.font = UIFont(name: "Rubik Regular", size: 12)
    label.textAlignment = .left
    
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 1000, height: 1000)
    
    couponsCollectionView = CouponCollectionView(frame: .zero, collectionViewLayout: layout)
    self.addSubview(couponsCollectionView)
    couponsCollectionView.backgroundColor = .white

    couponsCollectionView.translatesAutoresizingMaskIntoConstraints = false
    couponsCollectionView.backgroundColor = .white
    couponsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    couponsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    couponsCollectionView.topAnchor.constraint(equalTo: labelBGView.bottomAnchor, constant: 15).isActive = true
    couponsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    
    
    
  }
  
  
  func enableScrolling(bEnable: Bool) {
    couponsCollectionView.isScrollEnabled = bEnable
  }
  
  func showViewALlButton() {
    
    self.addSubview(viewAllButton)
    viewAllButton.setTitle("View All", for: .normal)
    viewAllButton.setTitleColor(UIColor(hexString: "3280C1"), for: .normal)
    viewAllButton.backgroundColor = .white
    viewAllButton.titleLabel?.font = UIFont(name: "Rubik Medium", size: 10)
    viewAllButton.translatesAutoresizingMaskIntoConstraints = false
    viewAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    viewAllButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
    viewAllButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    viewAllButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
//    viewAllButton.layer.cornerRadius = 10.5
//    viewAllButton.layer.borderWidth = 1
//    viewAllButton.layer.borderColor = UIColor.lightGray.cgColor
//    viewAllButton.layer.cornerRadius = 11
    
    viewAllButton.addTarget(self, action: #selector(viewAllAction), for: .touchUpInside)

  }
  
  @objc func viewAllAction() {
    print("viewAllAction....")
  }

}
