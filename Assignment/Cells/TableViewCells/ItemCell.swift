//
//  ItemCell.swift
//  Assignment
//
//  Created by SHUBHAM DHINGRA on 11/25/20.
//

import Foundation
import UIKit

class ItemCell : UITableViewCell  {
    
    
    @IBOutlet weak var lblTitle : UILabel?
    @IBOutlet weak var lblDescription : UILabel?
    @IBOutlet weak var imgItem : UIImageView?
    
    
    var model : Any?{
        didSet {
            configure()
        }
    }
    
    func configure() {
        if let model = model as? Item {
            lblTitle?.text = model.title
            lblDescription?.text = model.description
            if let url = model.image {
                imgItem?.loadURL(urlString: url, placeholder: nil , placeholderImage: nil)
            }
        }
    }
}
