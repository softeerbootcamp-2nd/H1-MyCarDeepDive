//
//  UIImageView+.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import UIKit

extension UIImageView {
    func setImage(urlString: String) {
        Task(operation: {
            do {
                let image = try await loadImageFrom(urlString: urlString)
                self.setImage(image: image)
            } catch {
                print("아?")
            }
        })
    }
    
    func loadImageFrom(urlString: String) async throws -> UIImage? {
        enum ImageLoadError: Error {
            case wrongURLString
            case badResponse
        }
        
        if DefaultGetYaCacheService.shared.isExist(urlString) {
            guard let data = DefaultGetYaCacheService.shared.load(urlString) else { throw NSError() }
            return UIImage(data: data)
        } else {
            guard let url = URL(string: urlString) else { throw ImageLoadError.wrongURLString }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ImageLoadError.badResponse}
            DefaultGetYaCacheService.shared.write(urlString, data: data)
            
            return UIImage(data: data)
        }
    }
    
    @MainActor private func setImage(image: UIImage?) {
        self.image = image
    }
}
