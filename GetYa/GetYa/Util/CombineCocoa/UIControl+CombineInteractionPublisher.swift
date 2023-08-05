//
//  UIControl+CombineInteractionPublisher.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/05.
//

import UIKit
import Combine

extension UIControl {
  // MARK: - InteractionPublihser
  
  /// ** Combine 간단 개념 요약**
  /// UIControl에 대한 이벤트를 구독하는 InteractionPublihser가 UIControl의 이벤트를 처리합니다.
  /// init한다고 처리하는 것은 아니고.. subscriber를 등록할 때! 그래서 receive(subscription:)이 호출될 때 부터 말입니다.
  /// 이때 Publihser는 Subscriber들에게 Subscription을 전달하고, 이벤트를 관리합니다.
  /// 이벤트가 발생하면 해당 Subscriber들에게 이벤트를 전달합니다. 이때 중간에 subscription을 통해 이벤틀르 전달합니다.
  /// 그래서 Subscriber는 Subscription을 통해 이벤트를 받아 처리합니다.
  /// Publihser가 subscriber에게 이벤트가 전달되는 것을 유지하려면, UIControl로부터 .touchUpInside를 target 중인
  /// subscription을 유지해야합니다 ( 메모리 로드,, == 인스턴스 만든 상태를 유지해야 합니다.)
  ///
  /// 근데 중요한것은? InteractionPublisher는 Publihser라는것!
  ///     - 다양한 operator를 붙일 수 있습니다.
  ///     - Combine's each operator의 특징은, 새로운 퍼블리셔 타입을 반환합니다... 퍼블리셔는 값을 방출할 수 있고,
  ///     - 또 operator가 붙을 수있고.. 그렇기에 chains가 가능합니다.
  ///     - 그 퍼블리셔를 누군가는 subscriber를 할 수 있습니다.
  struct InteractionPublisher: Publisher {
    // MARK: - Constant
    typealias Output = UIControl
    typealias Failure = Never
    typealias Event = UIControl.Event
    
    // MARK: - Properties
    private let control: Output
    private let event: Event
    
    // MARK: - Lifecycles
    init(control: Output, event: Event) {
      self.control = control
      self.event = event
    }
    
    // MARK: - Publihser
    /**
     subscriber에게 subscription을 전달하기 위한 receive(subscriber:)
     
     - parameter subscriber: Subscriber타입으로 upstream으로부터 값을 받습니다).
     
     **Notes: receive(subscriber:) 간단 요약**
     1. InteractionPublihser는 Publihser입니다.
     2. Publihser는 기본적으로 receive(subscriber:)를 통해 subscriber의 구독을 확인합니다.
     3. 이때 중요한 것은 publihser가 subscriber에게 바로 stream이 이어지지 않고,
     subscription을 통해서 퍼블리셔로부터 방출된 값이 subscriber에게 전달되거나 subscription을 cancel()합니다.
     subscriber가 publihser로부터의 구독을 취소할 수 있습니다.
     이로 인해 subscriber가 구독을 취소해도, 그 subscriber를 위한 resource는 subscription을 cancel()만 하면 됩니다.
     여전히 구독중인 다른 subscriber에게는 값을 방출합니다. 각각 고유의 subscription이 있기 때문입니다.
     4. 이 메서드가 항상 실행되는 것은 아닙니다.
     subscriber가 publihser를 구독할 때, subscribe(_:)를 호출한 후에 publihser는 subscriber를 위한 자원을. subscription을 통해 할당합니다.
     그 후 **subscriber**에게 subscription을 만들어서 반환합니다.
     Publihser는 subscriber를 몰라야 합니다. 그렇지만 upstream과 down stream의 Input, Failure type은. 같아야 합니다.
     5. subscription인스턴스를 유지한다면, publihser와 subscriber가 할당된 데이터가 유지되고, 그럴 경우엔
     upstream publihser로부터 emit 된 값이 subscription을 통해 subscriber에게 전달됩니다 : )
     */
    func receive<S>(subscriber: S)
    where S: Subscriber,
          Failure == S.Failure,
          Output == S.Input {
            let subscription = InteractionSubscription(
              subscriber: subscriber,
              control: control,
              event: event)
            
            subscriber.receive(subscription: subscription)
            
          }
  }
}
