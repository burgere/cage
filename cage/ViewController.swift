//
//  ViewController.swift
//  cage
//
//  Created by Eric Burger on 10/2/19.
//  Copyright © 2019 Eric Burger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imageView = UIImageView()
    var animator: UIDynamicAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: "niccage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100.0),
            imageView.widthAnchor.constraint(equalToConstant: 100.0)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let gravity = UIGravityBehavior(items: [imageView])
        animator = UIDynamicAnimator(referenceView: view)
        animator?.addBehavior(gravity)
        
        let collisions = UICollisionBehavior(items: [imageView])
        collisions.translatesReferenceBoundsIntoBoundary = true
        
        animator?.addBehavior(collisions)
    }

}

