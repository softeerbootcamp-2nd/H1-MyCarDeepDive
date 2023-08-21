//
//  Cacheable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

protocol Cacheable {
    associatedtype Key
    associatedtype Value
    
    func load(_ key: Key) -> Value?
    func isExist(_ key: Key) -> Bool
    func write(_ key: Key, data: Value?)
    func remove(_ key: Key)
    func removeAll()
}
