//
//  CameraViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 17/04/21.
//

import UIKit

protocol CameraViewControllerDelegate:class {
  func selectedImage(image:UIImage?)
}

class CameraViewController: UIViewController {

  var imagePicker: ImagePicker!
  weak var delegate: CameraViewControllerDelegate?
  var forSelfie: Bool = false
  var movingToNextScreen = false
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
    setupUI()
  }
  
  func setupUI() {
    self.view.backgroundColor = .white
    
    self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    if forSelfie  {
            
      self.imagePicker.isSelfie = true
    }
    self.imagePicker.present(from: self.view)
    
    let imageView = UIImageView()
    view.addSubview(imageView)
    imageView.image = UIImage(named: "bmclogo")
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: view.bounds.width / 2 - 45, y: 40, width: 90, height: 70)
    
    //addCamera()
  }
    override func viewDidLoad() {
        super.viewDidLoad()      
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if movingToNextScreen {
      self.imagePicker.present(from: self.view)
      movingToNextScreen = false
    }
  }
  
  private func addCamera() {
    let imagePickerView = UIImagePickerController()
    imagePickerView.sourceType = .camera    
    //imagePickerView.delegate = self
    //self.UINavigationControllerDelegate = self
    if forSelfie {
      imagePickerView.cameraDevice = .front
    }
    imagePickerView.allowsEditing = true
    imagePickerView.mediaTypes = ["public.image", "public.movie"]
   
    self.present(imagePickerView, animated: true, completion: nil)
  }
  
  private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)

        print("didSelect....")
    }
}

extension CameraViewController:  ImagePickerDelegate {
  func canceled() {
    self.navigationController?.popViewController(animated: true)
  }
  
  func didSelect(image: UIImage?) {
    
    print("Selected Photo")
    //movingToNextScreen = true
    self.delegate?.selectedImage(image: image)
  }
  
}
