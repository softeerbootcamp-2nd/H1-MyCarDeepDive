//
//  UIButton+Combine.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/05.
//

import UIKit
import Combine

@available(iOS 13.0, *)
public extension UIButton {
    ///UIButton이 터치될 때 ( UIControl.Event == .touchUpInside ) 퍼블리셔로 탭 이벤트 반환
    var tap: AnyPublisher<Void, Never> {
        publisher(for: .touchUpInside)
            .map { _ in }
            .eraseToAnyPublisher()
    }
}
