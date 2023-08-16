//
//  NSLayoutConstraint+.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import UIKit

extension NSLayoutConstraint {
    public class func activate(_ constraints: NSLayoutConstraint...) {
        _=constraints.map { $0.isActive = true }
    }
}
