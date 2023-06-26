//
//  NetworkConstants.swift
//  UTube
//
//  Created by Minh Tan Vu on 25/06/2023.
//

import Foundation

struct Constants {
    static var apiKey = ""
    static var playlistId = "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua"
    static let domain = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet"
    static var apiURL = "\(Constants.domain)&playlistId=\(Constants.playlistId)&key=\(Constants.apiKey)"

}

