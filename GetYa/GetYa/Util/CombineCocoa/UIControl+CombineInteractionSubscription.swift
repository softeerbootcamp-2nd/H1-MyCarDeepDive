//
//  UIControl+CombineInteractionSubscription.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/05.
//

import UIKit
import Combine

// MARK: - Combine interaction
extension UIControl {
    // MARK: - InteractionSubscription
    class InteractionSubscription<S: Subscriber>: Subscription
    where S.Input == UIControl {
        // MARK: - Constant
        typealias Event = UIControl.Event
        
        // MARK: - Properties
        private var subscriber: S?
        private let control: UIControl
        private let event: Event
        
        // MARK: - Lifecycle
        init(
            subscriber: S? = nil,
            control: UIControl,
            event: Event
        ) {
            self.subscriber = subscriber
            self.control = control
            self.event = event
            
            control.addTarget(
                self,
                action: #selector(handleEvent),
                for: event)
        }
        
        // MARK: - Action
        @objc func handleEvent(_ sender: UIControl) {
            /// subscriber는 upstream의 Input value로 UIControl을 받습니다.
            _=self.subscriber?.receive(control)
        }
        
        // MARK: - Subscription
        func request(_ demand: Subscribers.Demand) { }
        
        /// Publhiser와 Subscriber를 연결할 때, subscriber의 인스턴스가 해제되면 이 메서드 호출
        func cancel() {
            subscriber = nil
            control.removeTarget(
                self,
                action: #selector(handleEvent)
                , for: .touchUpInside)
        }
    }
}
