//
//  GridDetailViewController.swift
//  flixster
//
//  Created by Kyle Louderback on 2/28/22.
//

import UIKit
import AlamofireImage

class GridDetailViewController: UIViewController {
    

    var movie: [String:Any]!

    @IBOutlet weak var bigPosterImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gridTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        posterImage.isUserInteractionEnabled = true
       
        descriptionLabel.text = movie["overview"] as? String
        descriptionLabel.sizeToFit()
        gridTitle.text = movie["title"] as? String
//        gridTitle.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w154"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        posterImage.af.setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        
        bigPosterImage.af.setImage(withURL: backdropUrl!)
    }
   
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        Pass the selected movie to the details view controller
        let detailsViewController =  segue.destination as! VideoViewController
        detailsViewController.movie = movie
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
