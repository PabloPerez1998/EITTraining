//
//  DetailsViewController.swift
//  randomUserMap
//
//  Created by Consultant on 6/30/22.
//

import UIKit
import MapKit
import CoreLocation

class DetailsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    var user: User = User(name: [:], location: Location(city: "", state: "", coordinates: [:]), email: "", picture: [:])
    private let locationManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    private let userRadiusInMeters: Double = 100000

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationServicesCheck()
        
        userImageView.getImage(from: URL(string: user.picture["large"]!)!)
        userImageView.layer.borderWidth = 1
        userImageView.layer.masksToBounds = false
        userImageView.layer.borderColor = UIColor.black.cgColor
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.clipsToBounds = true
        userImageView.layer.masksToBounds = true
        nameLabel.text = "\(user.name["title"]!) \(user.name["first"]!) \(user.name["last"]!)"
        emailLabel.text = user.email
        placeLabel.text = "\(user.location.city), \(user.location.state)"
    }
    
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
            mapView.showsUserLocation = true
        case .authorizedAlways:
            mapView.showsUserLocation = true
            setUserCoordinates()
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            setUserCoordinates()
        default:
            break
        }
    }
    
    private func locationServicesCheck(){
        //Is GeoLocation enabled in the device
        if CLLocationManager.locationServicesEnabled() {
            setLocationServices()
            checkAuthStatus()
        }else{
            print("ok fine then...")
        }
    }
    
    private func setUserCoordinates(){
        do{
            let center = try CLLocationCoordinate2D(latitude: Double(user.location.coordinates["latitude"]!, format: .number ), longitude: Double(user.location.coordinates["longitude"]!, format: .number))
            let region = MKCoordinateRegion.init(center: center, latitudinalMeters: userRadiusInMeters, longitudinalMeters: userRadiusInMeters)
            mapView.setRegion(region, animated: true)
            annotation.coordinate = center
            mapView.addAnnotation(annotation)
        }catch{
            print("Could not obtain cords")
        }
    }


}

extension DetailsViewController: CLLocationManagerDelegate{
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthStatus()
    }
}
