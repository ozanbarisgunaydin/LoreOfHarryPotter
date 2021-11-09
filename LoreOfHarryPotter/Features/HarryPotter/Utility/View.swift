//
//  View.swift
//  LoreOfHarryPotter
//
//  Created by Ozan Barış Günaydın on 8.11.2021.
//

import UIKit

extension UIView{
 func maskLayerOnView(radius: CGFloat){
   let maskLayer = CAShapeLayer()
   maskLayer.path = UIBezierPath(roundedRect: self.bounds,
                    byRoundingCorners: [.allCorners],
                    cornerRadii: CGSize(width: radius,
                    height: radius)).cgPath
   self.layer.mask = maskLayer
 }
}
