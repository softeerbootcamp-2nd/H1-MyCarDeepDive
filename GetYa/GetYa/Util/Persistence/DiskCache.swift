//
//  DiskCache.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

final class DiskCache {
    
    static let shared = DiskCache(name: "cache")
    
    private var folderURL: URL? {
        FileManager.default.urls(
            for: .cachesDirectory,
            in: .userDomainMask
        ).first?.appendingPathComponent(self.name)
    }
    
    var name: String = "cache"
    
    init(name: String) {
        self.name = name
        createFolder()
    }
    
    private func createFolder() {
        guard let folderURL else { return }
        if FileManager.default.fileExists(atPath: folderURL.path) { return }
        try? FileManager.default.createDirectory(
            at: folderURL,
            withIntermediateDirectories: true
        )
    }
    
    func load(_ key: String) -> Data? {
        guard let fileURL = URL(string: key),
              let loadURL = folderURL?.appendingPathComponent(fileURL.pathComponents.dropFirst().joined()),
              let data = FileManager.default.contents(atPath: loadURL.path) else {
            return nil
        }
        return data
    }
    
    func write(_ key: String, data: Data?) {
        guard let fileURL = URL(string: key),
              let writeURL = folderURL?.appendingPathComponent(fileURL.pathComponents.dropFirst().joined()),
              let data else {
            return
        }
        
        let attributes: [FileAttributeKey: Any] = [.modificationDate: Date()]
        FileManager.default.createFile(
            atPath: writeURL.path,
            contents: data,
            attributes: attributes
        )
    }
    
    func isExist(_ key: String) -> Bool {
        guard let fileURL = URL(string: key),
              fileURL.lastPathComponent != "",
              let findURL = folderURL?.appendingPathComponent(fileURL.pathComponents.dropFirst().joined()) else {
            return false
        }
        return FileManager.default.fileExists(atPath: findURL.path)
    }
    
    func removeAll() {
        if let folderURL {
            try? FileManager.default.removeItem(at: folderURL)
        }
        self.createFolder()
    }
}
