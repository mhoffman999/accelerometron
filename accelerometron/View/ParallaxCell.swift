//
//  ParallaxCell.swift
//  accelerometron
//
//  Created by Michael Hoffman on 2/27/19.
//  Copyright © 2019 Here We Go. All rights reserved.
//

import UIKit

class ParallaxCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //Setup parallax code here
        
    }
    
    //Will be used in ListTVC to populate the tableview row with and image and description
    func configureCell (withImage image: UIImage, andDescription desc: String) {
        
        itemImageView.image = image
        descriptionLabel.text = desc
    }
    
    func setUpParallax() {
        //Setup amount of screen scroll, types of motion and values
    }
    
    

}
