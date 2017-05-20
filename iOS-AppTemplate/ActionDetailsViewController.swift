//
//  ActionDetailsViewController.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit
import MapKit

class ActionDetailsViewController: BaseViewController, MKMapViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var messages: UIView!
    
    @IBOutlet weak var descriptionScreen: UIView!
    @IBOutlet weak var call: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var horizontalSlider: UISlider!
    var annotationIsSet = false
    
    
    
    var shouldInitChat: (()-> Void)?
    
    @IBAction func initChat(_ sender: UIButton) {
        shouldInitChat?()
    }
 
    
    @IBAction func callOrganisator(_ sender: UIButton) {
        
        let phoneNumber = "00385993409697"
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    
    
    //MARK: - MAP
    
    private func handleMap() {
        
        mapView.mapType = .standard
        mapView.delegate = self
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(action(gestureRecognizer:)))
        longPressGesture.minimumPressDuration = 1
        longPressGesture.delaysTouchesBegan = true
        longPressGesture.delegate = self
        mapView.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func action(gestureRecognizer:UIGestureRecognizer){
        
        if annotationIsSet {
            
            let allAnnotations = mapView.annotations
            let allOverlays = mapView.overlays
            
            mapView.removeOverlays(allOverlays)
            mapView.removeAnnotations(allAnnotations)
        }
        
        let touchPoint = gestureRecognizer.location(in: mapView)
        
        
        let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        addRadiusCircle(location: newCoordinates)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        mapView.addAnnotation(annotation)
        annotationIsSet = true
    }
    
    private func addRadiusCircle(location: CLLocationCoordinate2D){
        let circle = MKCircle(center: location, radius: CLLocationDistance(horizontalSlider.value * 100000) as CLLocationDistance)
        self.mapView.add(circle)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let circle = MKCircleRenderer(overlay: overlay)
            circle.strokeColor = UIColor.red
            circle.fillColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.1)
            circle.lineWidth = 1
            return circle
        } else {
            return MKOverlayRenderer()
        }
    }
}
