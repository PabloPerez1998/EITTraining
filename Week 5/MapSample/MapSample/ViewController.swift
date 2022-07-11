//
//  ViewController.swift
//  MapSample
//
//  Created by Consultant on 6/30/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    private let userRadiusInMeters: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationServicesChek()
    }
    
    /*
     In the simulator by selecting debug you can simulate a location
     ATLANTA LAT = 33.7490 LON = 84.3880
     LONDON LAT = 51.5072 LON = 0.1276
     */
    
    /*
     CoreLocation Framework: Core Location provides services that determine a device's localitation, altitude and orientation, or its position relative to a nerby iBeacon device. The framework gathers data using all abailable components on the device, including the Wifi, GPS, Blutooth, magnometer, barometer and cellular hardware
        https://developer.aple.com/documentation/coreLocation
        What's new in Location WWDC '20
        https://developer.aple.com/videos/play/wwdc2020/10660
     */
    
    private func setLocationServices(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func  checkAuthStatus(){
        switch locationManager.authorizationStatus{
        case .restricted, .denied:
            break;
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
//            like delegate can also be set in Interface builder on storyboards
            mapView.showsUserLocation = true
        case .authorizedAlways:
            mapView.showsUserLocation = true
            grokUserLocation()
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            grokUserLocation()
        default:
            break
        }
    }
    
    private func grokUserLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: userRadiusInMeters, longitudinalMeters: userRadiusInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func locationServicesChek(){
        //Is GeoLocation enabled in the device
        if CLLocationManager.locationServicesEnabled() {
            setLocationServices()
            checkAuthStatus()
        }else{
            print("ok fine then...")
        }
    }


}

extension ViewController: CLLocationManagerDelegate{
    //grabs an array of locations in order to build a history of coordinates. From this we can determine heading/direction with some other built in methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.last else {return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: userRadiusInMeters, longitudinalMeters: userRadiusInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthStatus()
    }
}

