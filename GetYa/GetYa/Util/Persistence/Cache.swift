//
//  Cache.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

class DefaultGetYaCacheService {
    enum CacheError: Error {
        case encodeError
    }
    
    static let shared = DefaultGetYaCacheService(name: "cache")
    
    private let memoryCache: MemoryCache
    private let diskCache: DiskCache
    
    init(name: String) {
        memoryCache = MemoryCache(name: name)
        diskCache = DiskCache(name: name)
    }
    
    func load(_ key: String) -> Data? {
        if let data = memoryCache.load(key) {
            return data
        } else if let data = diskCache.load(key) {
            memoryCache.write(key, data: data)
            return data
        }
        return nil
    }
    
    func write<T: Encodable>(_ key: String, data: T?) {
        guard let data,
              let encodedData = try? JSONEncoder().encode(data) else {
            return
        }
        memoryCache.write(key, data: encodedData)
        diskCache.write(key, data: encodedData)
    }
    
    func isExist(_ key: String) -> Bool {
        memoryCache.isExist(key) || diskCache.isExist(key)
    }
    
    func removeAll() {
        memoryCache.removeAll()
        diskCache.removeAll()
    }
}
