//
//  Video.swift
//  UTube
//
//  Created by Minh Tan Vu on 25/06/2023.
//

import Foundation

struct Video: Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var publishedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case videoId
        case title
        case description
        case thumbnail = "url"
        case publishedAt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        //Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        //Parse the publish date
        self.publishedAt = try snippetContainer.decode(Date.self, forKey: .publishedAt)
        
        //Parse the thumbnail
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //Parse the videoId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
