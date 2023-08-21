//
//  MemoryCache.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

final class MeneoryCache: Cacheable {
    typealias Key = String
    typealias Value = AnyObject
    
    private let cache = NSCache<NSString, Value>()
    
    init(name: String) {
        cache.name = name
    }
    
    subscript(key: Key) -> Value? {
        get { return load(key) }
        set {
            guard let value = newValue else {
                remove(key)
                return
            }
            write(key, data: value)
        }
    }
    
    func load(_ key: Key) -> Value? {
        cache.object(forKey: key as NSString)
    }
    
    func write(_ key: Key, data: Value?) {
        cache.setObject(data as AnyObject, forKey: key as NSString)
    }
    
    func isExist(_ key: Key) -> Bool {
        return load(key) == nil
    }
    
    func remove(_ key: Key) {
        cache.removeObject(forKey: key as NSString)
    }
    
    func removeAll() {
        cache.removeAllObjects()
    }
}
