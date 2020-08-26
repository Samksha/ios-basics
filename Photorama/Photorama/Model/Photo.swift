//
//  Photo.swift
//  Photorama
//
//  Created by Samksha Bhardwaj on 18/08/20.
//  Copyright © 2020 Samksha Bhardwaj. All rights reserved.
//

import Foundation

class Photo: Codable {
    let title: String
    let remoteURL: URL?
    let photoID: String
    let dateTaken: Date
    
    enum CodingKeys: String, CodingKey {
        case title
        case remoteURL = "url_z"
        case photoID = "id"
        case dateTaken = "datetaken"
    }
}
