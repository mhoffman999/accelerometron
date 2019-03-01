//
//  ParallaxCell.swift
//  accelerometron
//
//  Created by Michael Hoffman on 2/27/19.
//  Copyright © 2019 Here We Go. All rights reserved.
//

import UIKit
import CoreMotion

class ParallaxCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //.... Call parallax code here ....
        
        setUpParallax()
        
/*
        //Parallax motion using accelerometer data
        //Uncomment to use this, BUT comment out "setUpParallax call above
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateImageView)
*/
 
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
    
    //For creating parallax motion using accelerometer data
    func updateImageView(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else {return}
        
        itemImageView.frame = CGRect(x: CGFloat(accelerometerData.acceleration.x) * 100, y: CGFloat(accelerometerData.acceleration.y) * 100, width: self.frame.size.width, height: self.frame.size.height)
        
    }
    
    

}
