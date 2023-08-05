//
//  UITextField+Combine.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/05.
//

import UIKit
import Combine


@available(iOS 13.0, *)
extension UITextField {
    /// A publisher emitting any text changes to this text field.
    var changed: AnyPublisher<String, Never> {
        publisher(for: .editingChanged)
            .compactMap { ($0 as? UITextField)?.text }
            .eraseToAnyPublisher()
    }
    
    /// A publisher that emits whenever the user taps the **return button**
    /// and **ends the editing** on the text field.
    var returnPublisher: AnyPublisher<Void, Never> {
        publisher(for: .editingDidEndOnExit)
            .map {_ in}
            .eraseToAnyPublisher()
    }
}
