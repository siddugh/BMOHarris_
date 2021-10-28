//
//  ReUploadIdentityViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 02/05/21.
//

import UIKit

enum Identity {
  case kPhoto
  case kAddress
}

protocol ReUploadIdentityViewControllerDelegate:class {
  func updatedAddresIdentity(image:UIImage?)
  func updatedPhotoIdentity(image:UIImage?)
}

class ReUploadIdentityViewController: UIViewController {

  weak var delegate: ReUploadIdentityViewControllerDelegate?
  var upDateIdentity:Identity = .kPhoto
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.view.backgroundColor = .white
      setupUI()
    }
  
  func setupUI() {
    
    let cameraController = CameraViewController()
    cameraController.delegate = self
    self.navigationController?.pushViewController(cameraController, animated: true)
  }
}

extension ReUploadIdentityViewController: CameraViewControllerDelegate {
  func selectedImage(image: UIImage?) {
    
    if upDateIdentity == .kPhoto {
      Helper.dumpImageToFile(image: image, file: photoIdentity)
      delegate?.updatedPhotoIdentity(image: image)
    }
    if upDateIdentity == .kAddress {
      Helper.dumpImageToFile(image: image, file: addressIdentity)
      delegate?.updatedAddresIdentity(image: image)
    }

  }
}
