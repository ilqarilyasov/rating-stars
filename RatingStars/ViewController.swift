//
//  ViewController.swift
//  RatingStars
//
//  Created by Ilgar Ilyasov on 1/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Rating"
    }

    @IBAction func updateRating(_ sender: CustomControl) {
        let rating = sender.value
        let star = rating == 1 ? "star" : "stars"
        title = "User Rating: \(rating) \(star)"
    }
}

