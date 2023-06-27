//
//  CacheManager.swift
//  UTube
//
//  Created by Minh Tan Vu on 27/06/2023.
//

import Foundation

class CacheMananger {
    
    static var videoCache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data) {
        videoCache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return videoCache[url]
    }
    
    
}
