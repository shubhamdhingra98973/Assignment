//
//  ItemDetailsViewController.swift
//  Assignment
//
//  Created by SHUBHAM DHINGRA on 11/26/20.
//

import Foundation
import UIKit

class ItemDetailsViewController : UIViewController {
    
    @IBOutlet weak var lblTitle : UILabel?
    @IBOutlet weak var lblDescription : UILabel?
    @IBOutlet weak var imgItem : UIImageView?
   
    var model : Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad()
    }
    
    func onViewDidLoad() {
        if let model = model {
            lblTitle?.text = model.title
            lblDescription?.text = model.description
            if let url = model.image {
                imgItem?.loadURL(urlString: url, placeholder: nil , placeholderImage: nil)
            }
        }
    }
    
    @IBAction func btnBackAct(_ sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

