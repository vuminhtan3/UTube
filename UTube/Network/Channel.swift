//
//  Channel.swift
//  UTube
//
//  Created by Minh Tan Vu on 27/06/2023.
//

import Foundation

struct Channel: Decodable {
    var id = ""
    var title = ""
    var description = ""
    var customUrl = ""
    var publishedAt: Date
    var thumbnail = ""
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        
        case id
        case title
        case description
        case customUrl
        case publishedAt
        case thumbnail = "url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //Parse channel id
        self.id = try container.decode(String.self, forKey: .id)
        
        //Parse title, description, customUrl, publishedAt
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.customUrl = try snippetContainer.decode(String.self, forKey: .customUrl)
        self.publishedAt = try snippetContainer.decode(Date.self, forKey: .publishedAt)
        
        //Parse channel thumbnail
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
    }
}
