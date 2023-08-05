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
