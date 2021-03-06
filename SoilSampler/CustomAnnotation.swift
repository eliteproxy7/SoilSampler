//
//  CustomAnnotation.swift
//  MapTest
//
//  Created by Samuel Hazlehurst on 3/20/15.
//  Copyright (c) 2015 Terranian Farm. All rights reserved.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    init(index: Int) {
        fieldIndex = index
        super.init()
    }
    var fieldIndex: Int
    var isSelected: Bool = false
    var isCorner: Bool = false
    var isEditable: Bool = true
    
    var coordinate = CLLocationCoordinate2D(latitude: 0,longitude: 0)
    
    var coord : CLLocation { get { return CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude) }}
//    func setCoordinate(newCoordinate: CLLocationCoordinate2D) {
//        self.coordinate = newCoordinate
//    }
    var title: String? = nil
    var subtitle: String? = nil
    
    
}

class CustomAnnotationView: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?)
    {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.image = UIImage(named: "draggable_icon")
        self.draggable = (annotation as! CustomAnnotation).isEditable
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.draggable = (self.annotation as! CustomAnnotation).isEditable
        self.setSelected(true, animated: true)
        super.touchesBegan(touches, withEvent: event)
    }
}
