//
//  ReusableCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 24/09/21.
//

import UIKit

public protocol ReusableCell {
  static var reuseIdentifier: String { get }
  static var nib: UINib { get }
}

public extension ReusableCell {
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
  
  static var nib: UINib {
    return UINib(nibName: reuseIdentifier, bundle: nil)
  }
}
