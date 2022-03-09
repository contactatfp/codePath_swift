//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Kyle Louderback on 3/8/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
