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
  /**
   UIButton이 터치될 때 ( UIControl.Event == .touchUpInside ) 퍼블리셔로 탭 이벤트 반환
   
   - parameter for event: UIControl.Event.
   - returns: AnyPublihser<Void, Never> 를 반환함으로 다양한 타입의 operator, subscription이 받을 수 있습니다.
   
   Notes:
   1. Rx를 공부하며 알게 됬는데 UI이벤트가 발생될 때 에러 발생 가능성이 없음을 보장하는 Relay가 있습니다.
   2. 요고도 그런 느낌?! Failure가 Never..
   3. 컴바인의 장점은 RxRelay처럼 에러 발생 가능성이 없을 경우를 특정 객체를 wrapping해서 만들지 않고 Failure 타입을 지정해주면 된다는 사실!!
   
   Example:
   ```
   let btn = UIButton(frame: .zero)
   let hoidingSubscriptionDuringThisScope = btn.tap.sink {
   print("버튼이 탭 될 때 프린트 됩니다.")
   }
   ```
   */
  
  var tap: AnyPublisher<Void, Never> {
    publisher(for: .touchUpInside)
      .map { _ in }
      .eraseToAnyPublisher()
  }
}
