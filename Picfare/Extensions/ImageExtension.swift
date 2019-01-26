//
//  ImageExtension.swift
//  Picfare
//
//  Created by Alejandro on 1/25/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    
    func load_image(url: URL) {
        image = nil
        let urlstring: String = url.absoluteString
        //not every time the image its being downloaded
        if let cachedImage = imageCache.object(forKey: urlstring as NSString) {
            self.image = cachedImage
            //print("the image is in cache: ", urlstring)
            return
        } else {
            //print("the image is downloaded: ", urlstring)
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: urlstring as NSString)
                        self.image = image
                    }
                }
            }
        }
    }
    
   
    
}
