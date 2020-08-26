//
//  PhotoSourceAPI.swift
//  Photorama
//
//  Created by Samksha Bhardwaj on 26/08/20.
//  Copyright © 2020 Samksha Bhardwaj. All rights reserved.
//

import Foundation

enum EndPoint: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

class PhotoSourceAPI {
    private let baseURLString = "https://api.flickr.com/services/rest"
    private let apiKey = "a6d819499131071f158fd740860a5a88"
    
    private func constructURL(endPoint: EndPoint, parameters: [String:String]?) -> URL {
        
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": endPoint.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]
        
        for(key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.url!
    }
    
    var interestingPhotosURL: URL {
        return constructURL(endPoint: .interestingPhotos, parameters: ["extras":"url_z,date_taken"])
    }
    
    func getPhotos(fromJSON data: Data) -> Result<[Photo], Error> {
        do {
            let decoder = JSONDecoder()
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let flickrResponse = try decoder.decode(FlickrResponse.self, from: data)
            let photos = flickrResponse.photosInfo.photos.filter { $0.remoteURL != nil}
            return .success(photos)
        } catch {
            return .failure(error)
        }
    }
    
    //To make decoding JSON a bit easier
    class FlickrPhotoResponse: Codable {
        let photos: [Photo]
        
        enum CodingKeys: String, CodingKey {
            case photos = "photo"
        }
    }
    
    class FlickrResponse: Codable {
        let photosInfo: FlickrPhotoResponse
        
        enum CodingKeys: String, CodingKey {
            case photosInfo = "photos"
        }
    }
}
