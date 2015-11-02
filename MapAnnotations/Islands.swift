//
//  Islands.swift
//  MapAnnotations
//
//  Created by Alex Beattie on 11/2/15.
//  Copyright © 2015 Alex Beattie. All rights reserved.
//

import UIKit
import MapKit

class Islands: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }

}
