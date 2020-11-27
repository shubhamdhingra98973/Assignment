//
//  ImageViewExtension.swift
//  Assignment
//
//  Created by SHUBHAM DHINGRA on 11/25/20.
//

import Foundation
import UIKit
import Kingfisher


extension UIImageView {
    
    func loadURL(urlString:String?, placeholder : String?, placeholderImage : UIImage?){
        
        guard let urlString = urlString else {
            print("Image url is nil")
            return
        }
        let url = URL(string: urlString)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: placeholderImage, options:
                          [.processor(processor),
                         .scaleFactor(UIScreen.main.scale),
                         .transition(.fade(1)),
                         .cacheOriginalImage], completionHandler: { result in
                         })
    }
}
