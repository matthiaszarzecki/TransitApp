//
//  DetailViewController.swift
//  SwiftTutorial01
//
//  Created by Matthias Zarzecki on 25/10/16.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var nameDisplay: UILabel!
  
  var detailItem: Route? {
    didSet {
      self.configureView()
    }
  }

  func configureView() {
    if let detail = self.detailItem {
      if let name = self.nameDisplay {
        name.text = "\(detail.type) \(detail.provider)"
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
