//
//  RouteViewController.swift
//  TransitApp01
//
//  Created by Matthias Zarzecki on 25/10/16.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var disclaimer: UILabel!
  @IBOutlet weak var providerIcon: UIWebView!
  
  var detailItem: Route?
  var objects = [RouteSegment]()
  
  // MARK: - Setup Functions

  func configureView() {
    if let detail = self.detailItem {
      price.text = Route.getPriceString(route: detail)
      disclaimer.text = detail.disclaimer ?? ""
      
      if let request = Route.getProviderIconRequestURL(route: detail) {
        providerIcon.loadRequest(request)
      }
      
      for segment in detail.segments! {
        if let segmentData = segment as? Dictionary<String, AnyObject> {
          let newSegment = RouteSegment()
          newSegment.name = getSegmentName(segmentData: segmentData)
          objects.append(newSegment)
        }
      }
    }
  }
  
  func getSegmentName(segmentData: Dictionary<String, AnyObject>) -> String {
    var name = ""
    name += (segmentData["travel_mode"] as? String) ?? ""
    name += (segmentData["name"] as? String) ?? ""
    return name
  }
  
  // MARK: - View Functions

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - TableView Functions
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let object = objects[(indexPath as NSIndexPath).row]
    cell.textLabel?.text = object.title
    return cell
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  
}
