//
//  UIView+Extensions.swift
//  Weather App
//
//  Created by Davi Paiva on 29/11/24.
//

import Foundation
import UIKit

extension UIView {
    func setConstraintsToParent(_ parent:UIView){
        self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
    }
}
