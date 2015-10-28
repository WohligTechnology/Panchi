//
//  TableViewController.swift
//  NoteShare
//
//  Created by Tushar Sachde on 21/10/15.
//  Copyright © 2015 Tushar Sachde. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var textArray: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textArray.addObject("BOTANY: THE CLASSIFICATION OF MANY BOX")
        
        self.textArray.addObject("Physics Theory Links")
        
        self.textArray.addObject("Maths")
        
        self.textArray.addObject("Computer Science")
        
        self.textArray.addObject("Graphics")
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.textArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = (self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell?)!
        
        cell.textLabel?.text = self.textArray.objectAtIndex(indexPath.row) as? String
        var bgView : UIView = UIView()
        bgView.backgroundColor = UIColor(red: 255.0/255.0, green: 172.0/255.0, blue: 175.0/255.0, alpha: 1.0)
        cell.selectedBackgroundView = bgView
        return cell
        
    }
    
    
}