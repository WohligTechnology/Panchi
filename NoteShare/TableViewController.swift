//
//  TableViewController.swift
//  NoteShare
//
//  Created by Tushar Sachde on 21/10/15.
//  Copyright © 2015 Tushar Sachde. All rights reserved.
//

import UIKit

import MGSwipeTableCell

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    let mainColor = UIColor(red: 255.0/255.0, green: 90.0/255.0, blue: 96.0/255.0, alpha: 1.0)
    let hoverColor = UIColor(red: 255.0/255.0, green: 172.0/255.0, blue: 175.0/255.0, alpha: 1.0)
    
    var notes = ["BOTANY: THE CLASSIFICATION OF MANY BOX", "Physics Theory Links", "Maths", "Computer Science", "Graphics"]
    var filteredNotes = [String]()
    var resultSearchController = UISearchController!()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.hidesNavigationBarDuringPresentation = true
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()

        self.resultSearchController.searchBar.barTintColor = UIColor(red: 255.0/255.0, green: 90.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        self.resultSearchController.searchBar.translucent = false
        self.resultSearchController.searchBar.tintColor = UIColor.whiteColor()
        self.definesPresentationContext = true
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
        
        //Clear Empty Cells
        let backgroundView = UIView(frame: CGRectZero)
        self.tableView.tableFooterView = backgroundView
        self.tableView.backgroundColor = UIColor.clearColor()
        
        //Show search on scroll
        self.tableView.setContentOffset(CGPoint(x: 0,y: 44), animated: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! MGSwipeTableCell!
        
        cell.rightButtons = [MGSwipeButton(title: "", icon: UIImage(named:"add.png"), backgroundColor: mainColor),MGSwipeButton(title: "",icon: UIImage(named:"add.png"), backgroundColor: mainColor)]
        
        //Set hover color for the Cells
        let bgView : UIView = UIView()
        bgView.backgroundColor = hoverColor
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