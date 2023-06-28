//
//  WotImageView.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import UIKit

private let imageCache = NSCache<NSString, UIImage>()

public class WotImageView: UIImageView {

    private var imagePath = ""

    public func loadImageUsing(_ path: String) {

        imagePath = path
        guard let url = URL(string: path) else { return }

        self.image = UIImage(named: "empty-poster")

        if let imageFromCache = imageCache.object(forKey: path as NSString) {
            self.image = imageFromCache
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> () in
            if error != nil { return }

            guard let data = data else  { return }

            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data) else { return }
                if self.imagePath == path {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache, forKey: path as NSString)
            }
        }).resume()
    }
}
