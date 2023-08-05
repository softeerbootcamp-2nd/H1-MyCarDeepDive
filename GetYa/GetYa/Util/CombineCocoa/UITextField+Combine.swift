//
//  UITextField+Combine.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/05.
//

import UIKit
import Combine

/// UITextField의 delegate없이 UIControl에서 터치가 발생되면 간단히 UIContorl.publihser(for:)를 통해
/// 전달되어진 이벤트 객체의 특정 값을 반환시킬 수 있습니다.
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
