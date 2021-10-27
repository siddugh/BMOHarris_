//
//  ServiceModel.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 24/09/21.
//

import Foundation

enum ServiceType {
  case kAddMoney
  case kMoveMoney
  case kCreditCard
  case kLockCard
  case kFindATMs
  case kSecurity
  case kDocs
  case kSavingGoals
}

public struct  ServiceModel {
  public var service: String? = nil
  public var bgColour: String? = nil
  public var colorOpacity: Double? = nil
  public var image: String? = nil
  var type: ServiceType! = ServiceType.kAddMoney
}
