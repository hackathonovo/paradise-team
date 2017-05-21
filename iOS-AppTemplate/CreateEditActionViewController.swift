//
//  CreateEditActionViewController.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit
import MapKit

class CreateEditActionViewController: BaseViewController, MKMapViewDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var horizontalSlider: UISlider!
    
    private var annotationIsSet = false
    private var coords: CLLocationCoordinate2D?
    
    var onShouldNavigateToUserList: ((_ title: String, _ range: Double, _ coordinates: CLLocationCoordinate2D) -> Void)?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        
        handleMap()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dalje", style: .done, target: self, action: #selector(nextTapped))
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool  {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func nextTapped() {
    
        onShouldNavigateToUserList?(titleTextField.text!, Double(horizontalSlider.value), self.coords!)
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
        self.coords = newCoordinates
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
