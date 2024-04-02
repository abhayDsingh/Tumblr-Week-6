import UIKit
import Nuke

class DetailViewController: UIViewController {
    var post: Post?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var summaryTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Ensure post is not nil and has data
        guard let post = post else {
            print("Post data is nil")
            return
        }
        
        // Update UI elements with post data
        summaryTextView.text = post.summary
        
        // Check if there's at least one photo
        if let photo = post.photos.first {
            let url = photo.originalSize.url
            // Use Nuke to load the image
            Nuke.loadImage(with: url, into: imageView)
       } else {
            print("No photos available for this post")
      }
    }
}
