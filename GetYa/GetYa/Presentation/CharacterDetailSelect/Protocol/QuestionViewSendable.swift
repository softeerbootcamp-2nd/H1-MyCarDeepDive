//
//  QuestionViewSendable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import UIKit

protocol QuestionViewSendable where Self: UIView {
    var selectedItemIndex: Int? { get }
    func sendCarMinimumAndMaximumPrice() -> (minimumValue: Int?, maximumValue: Int?)
}

extension QuestionViewSendable {
    var selectedItemIndex: Int? {
        nil
    }
    
    func sendCarMinimumAndMaximumPrice() -> (minimumValue: Int?, maximumValue: Int?) {
        return (nil, nil)
    }
}
