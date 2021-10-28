//
//  PersonalViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

class PersonalViewController: UIViewController {

  var infoTableView:UITableView = UITableView()
  var headeView:BMOHeaderView!
  var titleHeaderView:TitleHeaderView!
  override func loadView() {
    super.loadView()
    setupUI()
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  func setupUI() {
    self.view.backgroundColor = .white
    headeView = BMOHeaderView(frame: CGRect.zero)
    self.view.addSubview(headeView)
    headeView.translatesAutoresizingMaskIntoConstraints = false
    
    headeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    headeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    headeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    headeView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
      titleHeaderView = Bundle.main.loadNibNamed("TitleHeaderView", owner: self, options: nil)!.first as? TitleHeaderView
    titleHeaderView.titleLabel.text = "Personal info"
      view.addSubview(titleHeaderView)
      titleHeaderView.translatesAutoresizingMaskIntoConstraints = false
      titleHeaderView.initilize()
      
      titleHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive  = true
      titleHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive  = true
      titleHeaderView.topAnchor.constraint(equalTo: headeView.bottomAnchor, constant: 30).isActive  = true
      titleHeaderView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    addTableView()
  }
  
  func addTableView() {
    view.addSubview(infoTableView)
    infoTableView.translatesAutoresizingMaskIntoConstraints = false
    
    infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    infoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    infoTableView.topAnchor.constraint(equalTo: titleHeaderView.bottomAnchor, constant: -10).isActive = true
    
    infoTableView.backgroundColor = .white
    infoTableView.delegate = self
    infoTableView.dataSource = self
    infoTableView.register(PersonalInfoCell.nib, forCellReuseIdentifier: PersonalInfoCell.identifier)
    infoTableView.separatorStyle = .none
  }
}

extension PersonalViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInfoCell.identifier, for: indexPath) as! PersonalInfoCell
    cell.personalInfoView?.delegate = self
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    tableView.bounds.height
  }
}

extension PersonalViewController: PersonalInfoViewDelegate {
  
  func submit() {
    let controller = MessageViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  func moveBack() {
    self.navigationController?.popViewController(animated: true)
  }

}
