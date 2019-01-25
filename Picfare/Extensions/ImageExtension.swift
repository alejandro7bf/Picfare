//
//  ImageExtension.swift
//  Picfare
//
//  Created by Alejandro on 1/25/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit


extension UIImageView {
    
    
    func load_image(url: URL) {
        
        
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
    
   
    
}
