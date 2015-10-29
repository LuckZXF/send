//
//  AllListViewController.swift
//  推送
//
//  Created by 赵希帆 on 15/9/17.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class AllListViewController: UITableViewController {
    
    var lists = [Checklist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onCreateDate()
    }
    
    func onCreateDate() {
        for i in 0...4 {
            var item = Checklist(name: "任务类别:\(i)")
            lists.append(item)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = lists[indexPath.row].name
        cell!.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let checklist = lists[indexPath.row]
        self.performSegueWithIdentifier("ShowChecklist", sender: checklist)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        lists.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowChecklist" {
            let navigationcontrollrt = segue.destinationViewController as! UINavigationController
            let controller = navigationcontrollrt.topViewController as! MainController
            controller.checklist = sender as? Checklist
        }
    }
    
}
