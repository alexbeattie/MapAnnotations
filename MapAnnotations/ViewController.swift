//
//  ViewController.swift
//  MapAnnotations
//
//  Created by Alex Beattie on 11/2/15.
//  Copyright © 2015 Alex Beattie. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    var island:Islands!
    var locationManager:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        

        
        let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(1.50, 1.50)
        let theRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.817295, longitude: -123.500604), span: theSpan)
        mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 48.817295, longitude: -123.500604), animated: true)

        
        mapView.setRegion(theRegion, animated: true)
        
        let wallace = Islands(title: "Wallace Island", coordinate: CLLocationCoordinate2D(latitude: 48.9433496, longitude: -123.5472236), info: "Wallace Island, next to Galiano Island, was originally named Narrow Island.")
        let saturnaIsland = Islands(title: "Saturna Island", coordinate: CLLocationCoordinate2D(latitude: 48.789229, longitude: -123.165836), info: "Saturna Island is the most southern of the large Gulf Islands")
        let galianoIsland = Islands(title: "Galiano Island", coordinate: CLLocationCoordinate2D(latitude: 48.920004, longitude: -123.426807), info: "Galiano Island is a long, relatively narrow, island of 57 sq km.")
        let mayneIsland = Islands(title: "Mayne Island", coordinate: CLLocationCoordinate2D(latitude: 48.840845, longitude: -123.288332), info: "Mayne Island was first visited by Captain George Vancouver in 1790.")
        let saltSpringIsland = Islands(title: "Salt Spring Island", coordinate: CLLocationCoordinate2D(latitude: 48.817295, longitude: -123.500604), info: "Salt Spring Island was first named Admiral Island (circa 1858) by Captain Richards")
        
        mapView.addAnnotations([wallace, saturnaIsland, galianoIsland, mayneIsland, saltSpringIsland])

    
    }

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
           return nil
        }

        let identifier = "Islands"
        if annotation.isKindOfClass(Islands.self) {
         
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
           
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                let btn = UIButton(type: .DetailDisclosure)
                annotationView!.rightCalloutAccessoryView = btn
                
            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
        return nil
    }
    
    
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

        if control == view.rightCalloutAccessoryView {
            performSegueWithIdentifier("islandDetails", sender: self)
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let coord = locationObj.coordinate
        print(coord)
    }
   

    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

