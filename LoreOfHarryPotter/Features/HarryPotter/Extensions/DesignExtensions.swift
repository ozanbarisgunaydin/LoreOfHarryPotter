//
//  DesignExtensions.swift
//  LoreOfHarryPotter
//
//  Created by Ozan Barış Günaydın on 9.11.2021.
//

import UIKit

extension UILabel {
    func applyLabelDesign() {
        self.font = .boldSystemFont(ofSize: 18)
        self.textAlignment = .center
        self.textColor = .white
    }
}

extension UIView {
    func applyViewDesign() {
        self.backgroundColor = .black
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1
        self.layer.shadowColor = UIColor.yellow.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.cornerRadius = 5
    }
}

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
