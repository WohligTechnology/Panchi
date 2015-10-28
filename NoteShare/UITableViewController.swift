//
//  UITableViewController.swift
//  NoteShare
//
//  Created by Tushar Sachde on 21/10/15.
//  Copyright © 2015 Tushar Sachde. All rights reserved.
//

import UIKit

class UITableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var textArray: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.textArray.count
        
    }
    
}