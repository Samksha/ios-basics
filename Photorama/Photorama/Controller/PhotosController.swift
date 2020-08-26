//
//  PhotosController.swift
//  Photorama
//
//  Created by Samksha Bhardwaj on 25/08/20.
//  Copyright © 2020 Samksha Bhardwaj. All rights reserved.
//

import UIKit

enum PhotoError: Error {
    case imageCreationError
    case missingImageURL
}

class PhotosController {

    var store: PhotoStore = PhotoStore()
    
    //Convert to JPG
    private func processImageRequest(data: Data?, error: Error?) -> Result<UIImage, Error> {
        guard let imageData = data, let image = UIImage(data: imageData) else {
            if data == nil {
                return .failure(error!)
            } else {
                return .failure(PhotoError.imageCreationError)
            }
        }
        return .success(image)
    }
    
    func fetchImage(for photo: Photo, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let photoURL = photo.remoteURL else {
            completion(.failure(PhotoError.missingImageURL))
            return
        }
        let request = URLRequest(url: photoURL)
        
        let task = store.session.dataTask(with: request){
            (data, response, error) in
            
            let result = self.processImageRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    //Call model to get photos
    func fetchInterestingPhotos(completion: @escaping(Result<[Photo], Error>) -> Void) {
        store.fetchInterestingPhotos{
            (photosResult) in
            completion(photosResult)
        }
    }
}

