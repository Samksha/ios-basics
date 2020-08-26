//
//  PhotoStore.swift
//  Photorama
//
//  Created by Samksha Bhardwaj on 18/08/20.
//  Copyright © 2020 Samksha Bhardwaj. All rights reserved.
//

import UIKit

class PhotoStore {
    
    private var photoSource: PhotoSourceAPI = PhotoSourceAPI()
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    //Check if valid photo URL
    private func processPhotosRequest(data: Data?, error: Error?) -> Result<[Photo], Error> {
        
        guard let jsonData = data else {
            return .failure(error!)
        }
        return photoSource.getPhotos(fromJSON: jsonData)
    }
    
    //Call PhotoSourceAPI, store photos
    func fetchInterestingPhotos(completion: @escaping (Result<[Photo],Error>) -> Void) {
        
        let url = photoSource.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            let result = self.processPhotosRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
}
