//
//  TakePhotoInfoController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 17/04/21.
//

import UIKit


protocol TakePhotoInfoControllerDelegate:class {
  func onOpenCamera()
  func selectedImage(photo:UIImage?)
}

class TakePhotoInfoController: UIViewController {

  var takePhotoInfoView: TakePhotoInfo!
  weak var delegate: TakePhotoInfoControllerDelegate?
  var forSelfie:Bool  = false
  
  override func loadView() {
    super.loadView()
    self.view.backgroundColor = .white
    setupUI()
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
      
        // Do any additional setup after loading the view.
    }
  
  func setupUI() {
    self.view.backgroundColor = .white
    addInfoView()
  }
  
  
  @objc private func addInfoView() {
     
     takePhotoInfoView = Bundle.main.loadNibNamed("TakePhotoInfo", owner: self, options: nil)!.first as? TakePhotoInfo 
      takePhotoInfoView.translatesAutoresizingMaskIntoConstraints  = false
       self.view.addSubview(takePhotoInfoView)
      takePhotoInfoView.delegate = self
      takePhotoInfoView.initilize()
      takePhotoInfoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive  = true
      takePhotoInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive  = true
      takePhotoInfoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
      takePhotoInfoView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
   }
}

extension TakePhotoInfoController: TakePhotoInfoDelegate {
  func backAction() {
    self.navigationController?.popViewController(animated: true)
  }
  
  func openCamera() {
    //let controller = CameraViewController()
    //controller.delegate = self
    //self.navigationController?.pushViewController(controller, animated: true)
    delegate?.onOpenCamera()
  }
}

extension TakePhotoInfoController: CameraViewControllerDelegate {
  
  func selectedImage(image: UIImage?) {
    dismiss(animated: true, completion: nil)
    
    //let controller = UploadPhotoViewController()
    //controller.selectedImage = image
    //self.navigationController?.pushViewController(controller, animated: true)
    
    delegate?.selectedImage(photo: image)

  }
}
