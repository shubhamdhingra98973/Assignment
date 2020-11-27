//
//  Enum.swift
//  Assignment
//
//  Created by SHUBHAM DHINGRA on 11/24/20.
//

import Foundation


enum AppUrls : String {
    case Items = "https://gist.githubusercontent.com/ashwini9241/6e0f26312ddc1e502e9d280806eed8bc/raw/7fab0cf3177f17ec4acd6a2092fc7c0f6bba9e1f/saltside-json-data"
    
    var url : String {
        return self.rawValue
    }
}


enum CellIdentifier : String {
    case ItemCell = "ItemCell"
    
    var identifier : String {
        return self.rawValue
    }
}

enum StoryboardIdentifier : String {
    
    case ItemDetailsViewController = "ItemDetailsViewController"
    
    var identifier : String {
        return self.rawValue
    }
}
