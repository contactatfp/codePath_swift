//
//  VideoViewController.swift
//  flixster
//
//  Created by Kyle Louderback on 3/1/22.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {
    
    
    @IBOutlet weak var videoTrailer: WKWebView!
    
    var movie: [String:Any]!

    var trailers = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let movieID = movie["id"] as! Int
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 
                 print(dataDictionary)
                 
                 self.trailers = (dataDictionary["results"] as! [[String:Any]])
                 
                 print(self.trailers)
                 
                 let movieSelection = trailers[0]
                 let youtubeID = movieSelection["key"] as! String
                 let youtubeURL = URL(string: "https://youtube.com/watch?v=\(youtubeID)")
                 let myRequest = URLRequest(url: youtubeURL!)
                 videoTrailer.load(myRequest)
                 

             }
        }
        task.resume()
        

    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    

}
