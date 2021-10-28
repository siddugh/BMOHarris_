//
//  MenuDelegate.swift
//  BMO
//
//  Created by Siddu Hallikeri on 06/05/21.
//

import Foundation
import UIKit
protocol MenuDelegate:class {
  
  func reload()
  func showMenu()
  func showViewController(vController:HomeViewController)
}
