//
//  AboutData.swift
//
//  Created by iMac on 14/06/21
//  Copyright (c) . All rights reserved.
//

import Foundation

struct AboutData: Codable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageHref
        case descriptionValue = "description"
    }
    
    var title: String?
    var imageHref: String?
    var descriptionValue: String?
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        imageHref = try container.decodeIfPresent(String.self, forKey: .imageHref)
        descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    }
    
}
