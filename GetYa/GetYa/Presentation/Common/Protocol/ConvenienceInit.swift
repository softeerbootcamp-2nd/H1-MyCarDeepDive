//
//  ConvenienceInit.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

protocol ConvenienceInit {}
extension ConvenienceInit where Self: AnyObject {
  @inlinable
  func set(_ apply: (Self) throws -> Void) rethrows -> Self {
    try apply(self)
    return self
  }
}
extension NSObject: ConvenienceInit {}
