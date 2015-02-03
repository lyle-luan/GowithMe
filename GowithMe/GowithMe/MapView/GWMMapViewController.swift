//
//  GWMMapViewController.swift
//  GowithMe
//
//  Created by APP on 15/1/28.
//  Copyright (c) 2015年 Aaron. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

private enum annotationType
{
    case userLocationAnnotation
    case destinationAnnotation
}

class GWMMapViewController: UIViewController
{
    private var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        mapView = MKMapView(frame: UIScreen.mainScreen().bounds)
        self.view.addSubview(mapView)
        
        let longPressGesture = UILongPressGestureRecognizer()
        longPressGesture.minimumPressDuration = 1.0
        longPressGesture.addTarget(self, action: "didPickDestination:")
        mapView.addGestureRecognizer(longPressGesture)
        
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.showsUserLocation = true
    }
    
    func didPickDestination(recognizer:UILongPressGestureRecognizer)
    {
        recognizer.enabled = false
        mapView.removeAnnotations(mapView.annotations)
        
        let annotation = GWMAnnotation(anTitle: "tellOther", anCoordinate: mapView.convertPoint(recognizer.locationInView(mapView), toCoordinateFromView: mapView))
        mapView.addAnnotation(annotation)
        mapView.selectAnnotation(annotation, animated: true)
        
        recognizer.enabled = true
    }
    
    func tellOthers(senderButton:UIButton)
    {
        println("go to tell other")
        self.presentViewController(GWMFriendViewController(), animated: true, completion: nil)
    }
}

extension GWMMapViewController: MKMapViewDelegate
{
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!
    {
        func annotationView(currentAannotationType: annotationType) -> MKAnnotationView
        {
            if let pinDrop = mapView.dequeueReusableAnnotationViewWithIdentifier("Destination")
            {
                return pinDrop
            }
            else
            {
                let pinDrop = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Destination")
                pinDrop.animatesDrop = true
                pinDrop.canShowCallout = true
                
                let tellOther: UIButton = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIButton
                tellOther.addTarget(self, action: "tellOthers:", forControlEvents: UIControlEvents.TouchUpInside)
                pinDrop.rightCalloutAccessoryView = tellOther as UIView
                
                switch(currentAannotationType)
                {
                    case .userLocationAnnotation:
                        pinDrop.pinColor = MKPinAnnotationColor.Purple
                    case .destinationAnnotation:
                        pinDrop.pinColor = MKPinAnnotationColor.Red
                }
                return pinDrop
            }
        }
        
        if annotation.isKindOfClass(MKUserLocation)
        {
            return annotationView(.userLocationAnnotation)
        }
        else
        {
            return annotationView(.destinationAnnotation)
        }
    }
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!)
    {
        if let location = userLocation.location
        {
            mapView.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.5, 0.5))
        }
        else
        {
            println("location is nil")
        }
    }
}

extension GWMMapViewController: CLLocationManagerDelegate
{

}
