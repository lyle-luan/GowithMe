//
//  GWMAnnotation.swift
//  GowithMe
//
//  Created by Aaron on 2/2/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import Foundation
import MapKit

class GWMAnnotation: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    let title: String
    
    init(anTitle:String, anCoordinate:CLLocationCoordinate2D)
    {
        coordinate = anCoordinate
        title = anTitle
    }
}