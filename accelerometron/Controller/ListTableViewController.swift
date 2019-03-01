//
//  ListTableViewController.swift
//  accelerometron
//
//  Created by Michael Hoffman on 2/27/19.
//  Copyright © 2019 Here We Go. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    //**** BECAUSE THE ORIG VC WAS DELETED AND REPLACED WITH A TABLEVIEWCONTROLLER,
    //**** GO TO STORYBOARD "CLICK" FIRST TOP ICON AND CHECK "Is Initial View Controller"
    //**** IN THE ATTRIBUTES WINDOW
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return number of rows
        return imageArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return a configured cell with (... image and name)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "parallaxCell", for: indexPath) as? ParallaxCell else {return UITableViewCell()}
        
        cell.configureCell(withImage: imageArray[indexPath.row], andDescription: nameArray[indexPath.row])
        
        return cell
            
        }
    }




