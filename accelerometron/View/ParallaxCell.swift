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
        
        //Call parallax code here
        setUpParallax()
        
    }
    
    //Will be used in ListTVC to populate the tableview row with and image and description
    func configureCell (withImage image: UIImage, andDescription desc: String) {
        
        itemImageView.image = image
        descriptionLabel.text = desc
    }
    
    func setUpParallax() {
        //Setup amount of screen scroll, types of motion and values
        
        //Tracks amount of slide or movement of parallax effect along the x- and y-axis
        let min = CGFloat(-60)
        let max = CGFloat(60)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        //Adding the above motion effects to the imageView
        //Create a Motion Effect Group (like a folder to drop both effects into)
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion, yMotion]
        
        //Modify the UIImageView with the motionEffectGroup
        //Then call it in the awakeFromNib func up top
        itemImageView.addMotionEffect(motionEffectGroup)
        
    }
    
    

}
