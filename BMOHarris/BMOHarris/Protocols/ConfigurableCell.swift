//
//  ConfigurableCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 24/09/21.
//

import UIKit


public protocol ConfigurableCell: ReusableCell {
  associatedtype T
  
  func configure(_ item: T, indexPath: IndexPath)
}
