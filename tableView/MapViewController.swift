//
//  MapViewController.swift
//  tableView
//
//  Created by Joker on 03.04.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    let place = PlaceinTheCity.place
    
    @IBOutlet weak var largeMap: MKMapView!
    
    let locationUser = CLLocationManager()
    
    var userLocation = CLLocation()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationUser.delegate = self
        locationUser.startUpdatingLocation()
        
        let lat: CLLocationDegrees = place.lat
        let long: CLLocationDegrees = place.long
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        let anotation = MKPointAnnotation()
        anotation.coordinate = location
        anotation.title = place.name
        largeMap.addAnnotation(anotation)
        
        func locationManager (_ manager: CLLocationManager, didUpdateLocations locations:
                              [CLLocation]) {
            userLocation = locations[0]
            print(userLocation)

            let latDelta: CLLocationDegrees = 0.01
            let longDelta: CLLocationDegrees = 0.01
            let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
            let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
            largeMap.setRegion(region, animated: true)
            largeMap.delegate = self
    
            func mapView(_ mapview: MKMapView, didSelect view: MKAnnotationView) {
                print(view.annotation?.title)
                let sourceLocation = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
                print()
                print()
                print()
                print()
                print(userLocation.coordinate.latitude)
                print()
                print()
                print()
                print()
                print(place.lat)
                print()
                print()
                print()
                print()

                let destinationLocation = CLLocationCoordinate2D(latitude: place.lat, longitude: place.long)
                let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
                let destinationPlacemark = MKPlacemark(coordinate: destinationLocation,
                                                       addressDictionary: nil)
                let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
                let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
                let directionRequest = MKDirections.Request()
                // указываем точку А, то есть нашего пользователя
                directionRequest.source = sourceMapItem
                // указываем точку В, то есть метку на карте
                directionRequest.destination = destinationMapItem
                // выбираем на чем будем ехать - на машине
                directionRequest.transportType = .automobile
                // calc the direction
                let directions = MKDirections (request: directionRequest)
                // Запускаем просчет маршрута
                directions.calculate {
                    (response, error) -> Void in
                    // Если будет ошибка с маршрутом
                    guard let response = response else {
                        if let error = error {
                            print ("Error: \(error)")
                            print("Error")
                        }
                        return
                    }
                    // Берем первый машрут!
                    let route = response.routes[0]
                    // Рисуем на карте линию маршрута (polvline)
                    self.largeMap.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
                    // Приближаем карту с анимацией в регион всего маршрута
                    let rect = route.polyline.boundingMapRect
                    self.largeMap.setRegion(MKCoordinateRegion(rect), animated: true)
                    print("Маршрут построен!!!!!")
                }
            }
            
            func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
                // Настраиваем линию
                let renderer = MKPolylineRenderer(overlay: overlay)
                // Цвет красный
                renderer.strokeColor = UIColor.blue
                // Ширина линии
                renderer.lineWidth = 4.0
                
                return renderer
            }
            
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
