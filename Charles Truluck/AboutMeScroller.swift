//
//  AboutMeScroller.swift
//  Charles Truluck
//
//  Created by Charles on 4/17/15.
//  Copyright (c) 2015 Charles Truluck. All rights reserved.
//

import UIKit
import MapKit

class AboutMeScroller: UIView {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func awakeFromNib() {
    
    let location = CLLocationCoordinate2D(
        latitude: 32.7738,
        longitude: -79.9671
    )
    
    let span = MKCoordinateSpanMake(0.05, 0.05)
    let region = MKCoordinateRegion(center: location, span: span)
    mapView.setRegion(region, animated: true)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = location
    annotation.title = "Charleston"
    annotation.subtitle = "South Carolina"
    mapView.addAnnotation(annotation)
    
    }
}
