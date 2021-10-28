//
//  Helper.swift
//  BMO
//
//  Created by Siddu Hallikeri on 02/05/21.
//

import UIKit

var addressIdentity: String = "address"
var photoIdentity: String = "photo"
var physicalCaledLocked:Bool  = true
var vertiualCardLocked:Bool  = true
let REGISTER = "Registered"
class  Helper {
  
  class func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  class func dumpPhotoIdntity(image:UIImage?) {
    dumpImageToFile(image:image, file:photoIdentity)
  }
  class func dumpAderessIdntity(image:UIImage?) {
    dumpImageToFile(image:image, file:addressIdentity)
  }

  class func dumpImageToFile(image:UIImage?, file:String) {
    guard let image = image else {
      print("Cannot write image to file")
      return 
    }
    
    if let data = image.pngData() {
        let filename = getDocumentsDirectory().appendingPathComponent(file)
        try? data.write(to: filename)
    }
    
  }
  class func getSavedImage(named: String) -> UIImage? {
      if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
          return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
      }
      return nil
  }
  
  class func upDatePhysicalCardStatus(bLockedStatus: Bool) {
    UserDefaults.standard.set(bLockedStatus, forKey: PHYSICAL_CARDLOCKED)
    UserDefaults.standard.synchronize()
  }
  
  class func getPhysicalCardStatus() -> Bool {
    return UserDefaults.standard.bool(forKey: PHYSICAL_CARDLOCKED)
  }

  class func upDateVirtualCardStatus(bLockedStatus: Bool) {
    UserDefaults.standard.set(bLockedStatus, forKey: VIRTUAL_CARDLOCKED)
    UserDefaults.standard.synchronize()
  }
  
  class func getVirtualCardStatus() -> Bool {
    let vCard = UserDefaults.standard.bool(forKey: VIRTUAL_CARDLOCKED)
    return UserDefaults.standard.bool(forKey: VIRTUAL_CARDLOCKED)
  }
  
}
