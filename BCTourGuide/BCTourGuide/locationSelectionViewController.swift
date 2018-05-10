//
//  locationSelectionViewController.swift
//  BCTourGuide
//
//  Created by montserratloan on 4/30/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import UIKit

class locationSelectionViewController: UIViewController {

  @IBOutlet weak var locationLibraryLabel: UILabel!
  @IBOutlet weak var locationTableView: UITableView!
  var locations = ["Boston College", "Boston University", "Harvard University", "MIT", "Tufts University", "Emmanuel College", ""]
  override func viewDidLoad() {
        super.viewDidLoad()
    locationTableView.delegate = self
    locationTableView.dataSource = self
    addNavBar()
    
    }
  func addNavBar() {

    let navController = navigationController!

    let image = #imageLiteral(resourceName: "arto")
    let imageView = UIImageView(image: image)

    let bannerWidth = navController.navigationBar.frame.size.width
    let bannerHeight = navController.navigationBar.frame.size.height

    let bannerX = bannerWidth / 2 - image.size.width / 2
    let bannerY = bannerHeight / 2 - image.size.height / 2

    imageView.contentMode = .scaleAspectFit

    imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
    navigationItem.titleView = imageView
  }
  

}
extension locationSelectionViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = locationTableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
    cell.textLabel?.text = locations[indexPath.row]
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locations.count
  }
}
