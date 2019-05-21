//
//  ViewController.swift
//  APIRequestExample
//
//  Created by Justin Herzog on 5/20/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageURL = URL(string: "https://fsb.zobj.net/crop.php?r=bMRt0XFhT6zCHizZTOxtY2cZuS0wfGCWArL4Cr5cYSFcPXNFtWK6xMiWlyDXdaefwnWLMXIaJdXA9Zz1YZZvwNXxz9_mFEHQimbR8dxV9x5k6RgXYRGd7GutPmCx8-1lDHHId9gpMH_xaJWw")
    
    @IBOutlet weak var imageContainer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhoto()
    }
    
    func fetchPhoto() {
        guard let imageURL = imageURL else {
            print("Bad URL")
            return
        }
        
        let request = URLRequest(url: imageURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    let fetchedPhoto = UIImage(data: data!)
                    self.imageContainer.image = fetchedPhoto
                }
            }
        }
        task.resume()
    }
}

