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
        let penderIsland = Islands(title: "Pender Island", coordinate: CLLocationCoordinate2D(latitude: 48.787275, longitude: -123.288869), info: "Pender is actually two islands, a North and a South island. Before 1911, the islands were joined by an isthmus.")
        let thetisIsland = Islands(title: "Thetis Island", coordinate: CLLocationCoordinate2D(latitude: 48.995658, longitude: -123.676134), info: "Thetis Island was named by Captain Augustus Leopold Kuper, after his ship, the H.M.S. Thetis, a British frigate, which surveyed the area circa 1851. Thetis was first settled in 1873.")
        let deCourcyIsland = Islands(title: "DeCourcy Island", coordinate: CLLocationCoordinate2D(latitude: 49.1016976, longitude: -123.7394487), info: "De Courcy Island is located beside Valdes Island. De Courcy is about 300 acres in size. Home to deer, rabbits, racoons, and many eagles.")
        let hudsonIsland = Islands(title: "Hudson Island", coordinate: CLLocationCoordinate2D(latitude: 48.9640421, longitude: -123.678581), info: "Hudson Island is located beside Thetis Island, and Penelakut Island. Hudson is about 31 acres in size, about 14 acres is common property.")
        let jamesIsland = Islands(title: "James Island", coordinate: CLLocationCoordinate2D(latitude: 48.6033219, longitude: -123.355919), info: "James Island is located beside Sidney Island. James Island is 315 hectares in size.")
        let mudgeIsland = Islands(title: "Mudge Island", coordinate: CLLocationCoordinate2D(latitude: 49.1297025, longitude: -123.7920346), info: "Mudge Island was named by Captain Richards of the HMS Plumper after his Lieutenant William Fitzwilliam Mudge. Mudge Island is approximately 0.5 mile wide and 2.5 miles long. It is the most northern member of the De Courcy Group of Gulf Islands.")
        let parkerIsland = Islands(title: "Parker Island", coordinate: CLLocationCoordinate2D(latitude: 48.886372, longitude: -123.4127505), info: "Parker is located beside Galiano Island. Named after Lieutenant George Ferdinand Hastings Parker, R.N. of H.M.S Ganges, flag ship of Rear Admiral Baynes.")
        let piersIsland = Islands(title: "Piers Island", coordinate: CLLocationCoordinate2D(latitude: 48.7050503, longitude: -123.4161107), info: "Piers Island is located south of Salt Spring Island, near Portland Island. Piers is 97 hectares in size, and is named after Henry Piers, a British Royal Navy surgeon on the H.M.S. Satellite, who served on the coast between 1857 and 1860.")
        let portlandIsland = Islands(title: "Portland Island", coordinate: CLLocationCoordinate2D(latitude: 48.7231834, longitude: -123.3754543), info: "Portland Island was named after the HMS Portland, flagship of Rear Admiral Fairfax Moresby. The HMS Portland was commanded by Captain Henry Chads. The island was named by Captain G.H Richards of the HMS Plumper, in 1859. Portland is 534 hectares in size.")
        let prevostIsland = Islands(title: "Prevost Island", coordinate: CLLocationCoordinate2D(latitude: 48.8294719, longitude: -123.3796542), info: "Prevost Island was named after Captain James Charles Prevost of the HMS Satellite, by Captain Richards in 1859.")
        let reidIsland = Islands(title: "Reid Island", coordinate: CLLocationCoordinate2D(latitude: 48.9987165, longitude: -123.6244954), info: "Reid Island is named after Captain James Murray Reid, of the Brigantine Vancouver, for 28 years of service to the Hudson Bay Company. Captain Reid was from the Orkney Islands of Scotland.")
        let sidneyIsland = Islands(title: "Sidney Island", coordinate: CLLocationCoordinate2D(latitude: 48.6208012, longitude: -123.3074997), info: "Sidney Island, first named Sallas Island, circa 1850, by the officers of the Hudson Bay Company was one of the earliest places settled on Canada's Pacific Coast. Sidney Island was on the route from Fort Victoria to the Fraser River gold rush in 1858.")
        let valdesIsland = Islands(title: "Valdes Island", coordinate: CLLocationCoordinate2D(latitude: 49.0705993, longitude: -123.6540935), info: "Valdes is at the Northern end of what is generally considered the Southern Gulf Islands. It lies across Porlier Pass from Galiano Island.")
        let wiseIsland = Islands(title: "Wise Island", coordinate: CLLocationCoordinate2D(latitude: 48.901448, longitude: -123.4456323), info: "Wise Island is next to Parker Island and Galiano Island on the doorstep of Galiano's Montague Marine Park.")
        
        mapView.addAnnotations([wallace, saturnaIsland, galianoIsland, mayneIsland, saltSpringIsland, penderIsland, thetisIsland, deCourcyIsland, hudsonIsland, jamesIsland, mudgeIsland, parkerIsland, piersIsland, portlandIsland, prevostIsland, reidIsland, sidneyIsland, valdesIsland, wiseIsland])

    
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

