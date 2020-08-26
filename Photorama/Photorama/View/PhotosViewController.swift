//
//  ViewController.swift
//  Photorama
//
//  Created by Samksha Bhardwaj on 18/08/20.
//  Copyright © 2020 Samksha Bhardwaj. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

//    var store: PhotoStore!
    var controller: PhotosController = PhotosController()
    @IBOutlet private var imageView: UIImageView!
    
    //Call controller to fetch JSON
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.fetchInterestingPhotos {
            (photosResult) in
            
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos) photos.")
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case let .failure(error):
                print("Error fetching photos: \(error)")
            }
        }
    }
    
    func updateImageView(for photo: Photo) {
        controller.fetchImage(for: photo) {
            (imageResult) in

            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }
    
}

