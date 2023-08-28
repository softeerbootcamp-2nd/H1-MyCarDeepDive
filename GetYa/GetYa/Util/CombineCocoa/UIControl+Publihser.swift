//
//  UIControl+Publihser.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/05.
//

import UIKit
import Combine

@available(iOS 13.0, *)
extension UIControl {
    /// UIControl타입의 객체는 publisher를 사용할 수 있습니다
    /// InteractionSubscription은 .touchUpInside 이벤트나 .editingChanged등
    /// 다양한 UIControl.Event 중 하나를 subscription에서 addTarget함으로
    ///  특정 이벤트가 발생할 때 subscriber에게 객체를 반환합니다 :)
    func publisher(
        for event: UIControl.Event
    ) -> UIControl.InteractionPublisher {
        return .init(control: self, event: event)
    }
}
