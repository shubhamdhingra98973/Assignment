//
//  ItemsModal.swift
//  Assignment
//
//  Created by SHUBHAM DHINGRA on 11/24/20.
//

import Foundation

struct Item : Codable {

    let description : String?
    let image : String?
    let title : String?


    enum CodingKeys: String, CodingKey {
        case description = "description"
        case image = "image"
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}
