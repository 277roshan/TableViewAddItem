//
//  ViewController.swift
//  TableViewAddItem
//
//  Created by Roshan Thapaliya on 2/20/16.
//  Copyright © 2016 Roshan Thapaliya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items:[String] = ["We","Heart","Swift","asdfasf","We","Heart","Swift","asdfasf"]
    
    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet weak var Edit: UIBarButtonItem!
    
   
    @IBOutlet weak var Add: UIBarButtonItem!
    
    @IBOutlet weak var addField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.delegate = self
        myTableView.dataSource = self
        self.myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = items[row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if (self.myTableView.editing) {
            return UITableViewCellEditingStyle.Delete
        }
        return UITableViewCellEditingStyle.None
    }
    
    
    
    @IBAction func editAction(sender: AnyObject) {
        if (self.myTableView.editing) {
            Edit.title = "Edit"
            self.myTableView.setEditing(false, animated: true)
        } else {
            Edit.title = "Done"
            self.myTableView.setEditing(true, animated: true)
        }
    }
   
    
    @IBAction func addAction(sender: AnyObject) {
        
        if let newItem = self.addField {
            if newItem.text!.characters.count > 0{
                items.append(newItem.text!)
                self.myTableView.reloadData()
            }
        }
        
    
    }


    
    


}

