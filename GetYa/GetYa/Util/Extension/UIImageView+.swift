//
//  UIImageView+.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import UIKit

extension UIImageView {
    enum ImageType {
        case thumbnail
        case normal
    }
    func setImage(urlString: String, _ imageType: ImageType = .normal) {
        Task(operation: {
            do {
                let image = try await loadImageFrom(urlString: urlString, imageType)
                self.setImage(image: image)
            } catch {
                print("Image Load에 실패하였습니다.")
            }
        })
    }
    
    func loadImageFrom(urlString: String, _ imageType: ImageType) async throws -> UIImage? {
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
            if imageType == .normal {
                return maybeImage
            }
            guard let thumbnail = await maybeImage?.thumbnail else {
                throw ImageLoadError.badImage
            }
            return thumbnail
        }
    }
    
    private func setImage(image: UIImage?) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
}
