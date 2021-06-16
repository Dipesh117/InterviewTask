//
//  AboutResponse.swift
//
//  Created by iMac on 14/06/21
//  Copyright (c) . All rights reserved.
//

import Foundation

struct AboutResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case rows
        case title
    }
    
    var rows: [AboutData]?
    var title: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rows = try container.decodeIfPresent([AboutData].self, forKey: .rows)
        title = try container.decodeIfPresent(String.self, forKey: .title)
    }
    
}
