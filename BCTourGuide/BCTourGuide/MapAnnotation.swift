//
//  MapAnnotation.swift
//  BCTourGuide
//
//  Created by montserratloan on 4/20/18.
//  Copyright © 2018 Juan Suarez. All rights reserved.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
  let coordinate: CLLocationCoordinate2D
  let title: String?
  let item: ARItem
  
  init(location: CLLocationCoordinate2D, item: ARItem) {
    self.coordinate = location
    self.item = item
    self.title = item.itemDescription
    
    super.init()
  }
}
