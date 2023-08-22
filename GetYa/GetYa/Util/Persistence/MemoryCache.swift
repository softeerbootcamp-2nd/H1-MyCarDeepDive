//
//  MemoryCache.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

final class MemoryCache {
    
    static let shared = MemoryCache(name: "cache")
    
    private let cache = NSCache<NSString, AnyObject>()
    
    init(name: String) {
        cache.name = name
    }
    
    func load(_ key: String) -> Data? {
        cache.object(forKey: key as NSString) as? Data
    }
    
    func write(_ key: String, data: Data?) {
        cache.setObject(data as AnyObject, forKey: key as NSString)
    }
    
    func isExist(_ key: String) -> Bool {
        cache.object(forKey: key as NSString) != nil
    }
    
    func removeAll() {
        self.cache.removeAllObjects()
    }
    
}
