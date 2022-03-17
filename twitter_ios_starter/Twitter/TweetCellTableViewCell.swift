//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Kyle Louderback on 3/8/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var favOutlet: UIButton!
    
    
    
    
    @IBAction func favButton(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success: {
                self.setFavorite(true)            }, failure: { Error in
                    print("Error favoriting the tweet")
                })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success: {
                self.setFavorite(false)
            }, failure: { Error in
                print("Error Unfavoriting the tweet")
            })
        }
    }
    
    @IBOutlet weak var retweetOutlet: UIButton!
    @IBAction func retweetBtn(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetId, success: {
            self.setRetweet(true)
        }, failure: { Error in
            print("error in retweeting")
        })
    }

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var tweetCountdown: UILabel!
    
    var favorited: Bool = false

    var tweetId: Int = -1
    
    
    
    func setFavorite(_ isFavorited: Bool){
        favorited = isFavorited
        if(isFavorited){
            favOutlet.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favOutlet.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)

        }
    }
    
    func setRetweet(_ isRetweeted: Bool){
        if(isRetweeted){
            retweetOutlet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetOutlet.isEnabled = false
        }
        else{
            retweetOutlet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetOutlet.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
