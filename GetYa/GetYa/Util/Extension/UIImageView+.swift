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
                print("Image Load에 실패하였습니다.")
            }
        })
    }
    
    func loadImageFrom(urlString: String) async throws -> UIImage? {
        enum ImageLoadError: Error {
            case wrongCacheData
            case wrongURLString
            case badResponse
            case badImage
        }
        
        let urlString = "https://" + urlString
        
        if DefaultGetYaCacheService.shared.isExist(urlString) {
            guard let data = DefaultGetYaCacheService.shared.load(urlString) else {
                throw ImageLoadError.wrongCacheData
            }
            return UIImage(data: data)
        } else {
            guard let url = URL(string: urlString) else {
                throw ImageLoadError.wrongURLString
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw ImageLoadError.badResponse
            }
            DefaultGetYaCacheService.shared.write(urlString, data: data)
            
            let maybeImage = UIImage(data: data)
            guard let thumbnail = await maybeImage?.thumbnail else {
                throw ImageLoadError.badImage
            }
            return thumbnail
        }
    }
    
    @MainActor private func setImage(image: UIImage?) {
        self.image = image
    }
}
