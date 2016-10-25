//
//  DetailViewController.swift
//  SwiftTutorial01
//
//  Created by Matthias Zarzecki on 25/10/16.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var price: UILabel!
  
  var detailItem: Route? {
    didSet {
      self.configureView()
    }
  }

  func configureView() {
    if let detail = self.detailItem {
      if let nameDisplay = self.name {
        nameDisplay.text = "\(detail.type) \(detail.provider)"
      }
      
      if let priceDisplay = self.price {
        priceDisplay.text = getPriceString(route: detail)
      }
    }
  }
  
  func getPriceString(route: Route) -> String {
    if let priceDetail = route.price {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.currencyCode = (priceDetail["currency"] as? String) ?? "EUR"
      if let amount = priceDetail["amount"] as? Double {
        return formatter.string(from: NSNumber(value: amount * 0.01))!
      }
    }
    return ""
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
