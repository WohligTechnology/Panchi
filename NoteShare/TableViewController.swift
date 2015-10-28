//
//  TableViewController.swift
//  NoteShare
//
//  Created by Tushar Sachde on 21/10/15.
//  Copyright © 2015 Tushar Sachde. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let notes = ["BOTANY: THE CLASSIFICATION OF MANY BOX", "Physics Theory Links", "Maths", "Computer Science", "Graphics"]
    var filteredNotes = [String]()
    var resultSearchController = UISearchController()

    
    var textArray: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
        
        //Automate the height of rows
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        
        //Clear Empty Cells
        var backgroundView = UIView(frame: CGRectZero)
        self.tableView.tableFooterView = backgroundView
        self.tableView.backgroundColor = UIColor.clearColor()
        
        //Show search on scroll
        self.tableView.setContentOffset(CGPoint(x: 0,y: 44), animated: true)
        self.searchBar.resignFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.resultSearchController.active)
        {
            return self.filteredNotes.count
        }
        else
        {
            return self.notes.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Put data into cells
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell?
        
        //Set hover color for the Cells
        var bgView : UIView = UIView()
        bgView.backgroundColor = UIColor(red: 255.0/255.0, green: 172.0/255.0, blue: 175.0/255.0, alpha: 1.0)
        cell!.selectedBackgroundView = bgView
        
        if (self.resultSearchController.active)
        {
            cell!.textLabel?.text = self.filteredNotes[indexPath.row]
            
            return cell!
        }
        else
        {
            cell!.textLabel?.text = self.notes[indexPath.row]
            
          return cell!
        }
    
    }

    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        self.filteredNotes.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.notes as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredNotes = array as! [String]
        
        self.tableView.reloadData()
    }

}