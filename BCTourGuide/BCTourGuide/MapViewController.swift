//
//  MapViewController.swift
//  BCTourGuide
//
//  Created by montserratloan on 4/20/18.
//  Copyright © 2018 Juan Suarez. All rights reserved.
//
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!
  var targets = [ARItem]()
  let locationManager = CLLocationManager()
  var userLocation: CLLocation?
  var selectedAnnotation: MKAnnotation?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
    
    if CLLocationManager.authorizationStatus() == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
    }
    setupLocations()
  }
  
  func setupLocations() {
    let firstTarget = ARItem(itemDescription: "wolf", location: CLLocation(latitude: 42.333425, longitude: -71.1693303), itemNode: nil)
    targets.append(firstTarget)
    
    let secondTarget = ARItem(itemDescription: "lumberJack", location: CLLocation(latitude: 42.3342032, longitude: -71.1744118), itemNode: nil)
    targets.append(secondTarget)
    
    let thirdTarget = ARItem(itemDescription: "car", location: CLLocation(latitude: 42.3359002, longitude: -71.1692033), itemNode: nil)
    targets.append(thirdTarget)
    
    let fourthTarget = ARItem(itemDescription: "wolf", location: CLLocation(latitude: 42.3364588, longitude: -71.1711824), itemNode: nil)
    targets.append(fourthTarget)
    
    let fifthTarget = ARItem(itemDescription: "dragon", location: CLLocation(latitude: 42.3332384, longitude: -71.1717839), itemNode: nil)
    targets.append(fifthTarget)
    
    let sixthTarget = ARItem(itemDescription: "wolf", location: CLLocation(latitude: 42.3337673, longitude: -71.1751068), itemNode: nil)
    targets.append(sixthTarget)
    
    let seventhTarget = ARItem(itemDescription: "lumberJack", location: CLLocation(latitude: 42.3337279, longitude: -71.1707724), itemNode: nil)
    targets.append(seventhTarget)
    
    let eigthTarget = ARItem(itemDescription: "dragon", location: CLLocation(latitude: 42.3335348, longitude: -71.1701725), itemNode: nil)
    targets.append(eigthTarget)
    
    let ninthTarget = ARItem(itemDescription: "dragon", location: CLLocation(latitude: 42.3345284, longitude: -71.1700579), itemNode: nil)
    targets.append(ninthTarget)
    
    let tenthTarget = ARItem(itemDescription: "wolf", location: CLLocation(latitude: 42.3344533, longitude: -71.1702366), itemNode: nil)
    targets.append(tenthTarget)
    
    let elTarget = ARItem(itemDescription: "dragon", location: CLLocation(latitude: 42.3212616, longitude: -71.1762558), itemNode: nil)
    targets.append(elTarget)
    
    for item in targets {
      let annotation = MapAnnotation(location: item.location.coordinate, item: item)
      self.mapView.addAnnotation(annotation)
    }
  }
}

extension MapViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    self.userLocation = userLocation.location
  }
  
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    let coordinate = view.annotation!.coordinate
    
    if let userCoordinate = userLocation {
      if userCoordinate.distance(from: CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)) < 50 {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ARViewController") as? ViewController {
          
          viewController.delegate = self
          
          if let mapAnnotation = view.annotation as? MapAnnotation {
            
            viewController.target = mapAnnotation.item
            viewController.userLocation = mapView.userLocation.location!
            selectedAnnotation = view.annotation
            self.present(viewController, animated: true, completion: nil)
          }
        }
      }
    }
  }
}

extension MapViewController: ViewControllerDelegate {
  func viewController(controller: ViewController, tappedTarget: ARItem) {
    self.dismiss(animated: true, completion: nil)
    let index = self.targets.index(where: {$0.itemDescription == tappedTarget.itemDescription})
    self.targets.remove(at: index!)
    
    if selectedAnnotation != nil {
      mapView.removeAnnotation(selectedAnnotation!)
    }
  }
}
