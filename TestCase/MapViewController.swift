//
//  MapViewController.swift
//  MapSample
//
//  Created by Jayron Cena on 23/05/2017.
//  Copyright © 2017 Jayron Cena. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    var mapSearchString = ""
    
    @IBAction func textFieldReturn(_ sender: Any) {
        mapSearchString = "hospital"
        mapView.removeAnnotations(mapView.annotations)
        self.performSearch()
        
    }
    @IBAction func ShowPark(_ sender: Any) {
        
        mapSearchString = "park"
        mapView.removeAnnotations(mapView.annotations)
        self.performSearch()
    }
    @IBOutlet weak var mapView: MKMapView!
    
    var matchingItems: [MKMapItem] = [MKMapItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        mapView.showsUserLocation =  true
    }
    @IBAction func zoomIn(_ sender: Any) {
        let userLocation = mapView.userLocation
        if let locationLoaded = userLocation.location{
            let region = MKCoordinateRegionMakeWithDistance(locationLoaded.coordinate,  5000,5000)
            mapView.setRegion(region, animated: true)
        }
        
    }
    @IBAction func changeMapType(_ sender: Any) {
        if mapView.mapType == MKMapType.standard{
            mapView.mapType = MKMapType.satellite
        }
        else{
            mapView.mapType = MKMapType.standard
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, didUpdate
        userLocation: MKUserLocation){
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
    
    func performSearch()
    {
        matchingItems.removeAll()
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = mapSearchString
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: {(response, error) in
            
            if error != nil {
                print("Error occured in search:\(error!.localizedDescription)")
            } else if response!.mapItems.count == 0 {
                print("No matches found")
            } else {
                print("Matches found")
                
                for item in response!.mapItems {
                    print("Name = \(String(describing: item.name))")
                    print("Phone = \(String(describing: item.phoneNumber))")
                    
                    self.matchingItems.append(item as MKMapItem)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    //   var annotationVar = "\(item.name!) \n \(item.phoneNumber!)"
                    annotation.title = item.name
                    annotation.subtitle = item.phoneNumber
                    self.mapView.addAnnotation(annotation)
                }
            }
        })
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
