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
            imageView.heightAnchor.constraint(equalToConstant: 200.0),
            imageView.widthAnchor.constraint(equalToConstant: 200.0)
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

