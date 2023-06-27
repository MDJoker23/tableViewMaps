//
//  ViewController.swift
//  tableView
//
//  Created by Joker on 21.03.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSurname: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var disHero: UIImageView!
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    var userLocation = CLLocation()
    var place = detail()
    var name = ""
    var imageName = ""
    var descript = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = place.name
        imageView.image = UIImage(named: place.imageName)
        disHero.image = UIImage(named: place.descript)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        let lat: CLLocationDegrees = place.lat
        let long: CLLocationDegrees = place.long
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        let anotation = MKPointAnnotation()
        anotation.coordinate = location
        anotation.title = place.name
        map.addAnnotation(anotation)
    }
}

