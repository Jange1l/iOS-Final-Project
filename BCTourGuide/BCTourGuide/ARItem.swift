//
//  ARItem.swift
//  BCTourGuide
//
//  Created by montserratloan on 4/20/18.
//  Copyright © 2018 Juan Suarez. All rights reserved.
//

import Foundation
import CoreLocation
import SceneKit


// ARitem Struct 
struct ARItem {
  let itemDescription: String
  let location: CLLocation
  var itemNode: SCNNode?
}
