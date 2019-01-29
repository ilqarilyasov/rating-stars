//
//  ViewController.swift
//  RatingStars
//
//  Created by Ilgar Ilyasov on 1/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let rating = ratingControl.value
        let star = rating == 1 ? "star" : "stars"
        title = "User Rating: \(rating) \(star)"
    }
}

