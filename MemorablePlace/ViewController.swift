//
//  ViewController.swift
//  MemorablePlace
//
//  Created by The book Air on 02/09/2019.
//  Copyright © 2019 jisung. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if activePlace != -1 {
            
            if places.count > activePlace {
                
                if let name = places[activePlace]["name"] {
                    
                    if let lat = places[activePlace]["lat"] {
                        
                        if let lon = places[activePlace]["lon"]{
                            
                            if let latitude = Double(lat){
                                if let longitude = Double(lon){
                                    
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    
                                    self.map.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    
                                    annotation.coordinate = coordinate
                                    
                                    annotation.title = name
                                    
                                    self.map.addAnnotation(annotation)
                                }
                            }
                        }
                        
                    }
                }
                
            }
        }
    }


}

