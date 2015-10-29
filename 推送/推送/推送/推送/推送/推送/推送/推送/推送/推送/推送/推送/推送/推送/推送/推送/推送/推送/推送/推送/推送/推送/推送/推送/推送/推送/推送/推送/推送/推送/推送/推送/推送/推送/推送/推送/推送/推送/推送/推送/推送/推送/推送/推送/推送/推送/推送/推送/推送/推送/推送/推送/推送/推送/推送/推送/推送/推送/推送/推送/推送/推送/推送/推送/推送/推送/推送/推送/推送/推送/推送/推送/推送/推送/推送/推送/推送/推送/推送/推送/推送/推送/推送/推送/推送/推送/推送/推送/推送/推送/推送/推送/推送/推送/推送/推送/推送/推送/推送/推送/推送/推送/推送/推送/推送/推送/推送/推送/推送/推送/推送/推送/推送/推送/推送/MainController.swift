//
//  MainController.swift
//  推送
//
//  Created by 赵希帆 on 15/9/16.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class MainController: UITableViewController , MainListControllerDelegate{
    
    var arrData = [MainItem]()
    var checklist:Checklist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.checklist?.name
       // onCreateDate()
       // saveChecklistItems()
        loadCheckListItems()
        println("沙盒文件夹路径:\(documentsDirectory())")
        println("数据文件夹路径:\(dataFilePath())")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func documentsDirectory() -> String{
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var documentsDirectory : String = paths.first as! String
        return documentsDirectory
    }
    
    func dataFilePath() -> String{
        return self.documentsDirectory().stringByAppendingString("Checklists.plist")
    }
    
    func loadCheckListItems() {
        let path = self.dataFilePath()
        let defaultManager = NSFileManager()
        if defaultManager.fileExistsAtPath(path) {
            let data = NSData(contentsOfFile: path)
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
            arrData = unarchiver.decodeObjectForKey("ChecklistItems") as! Array
            unarchiver.finishDecoding()
        }
        else{
            saveChecklistItems()
        }
        
    }
    
    func saveChecklistItems() {
        var data = NSMutableData()
        var archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(arrData, forKey: "ChecklistItems")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func onCreateDate(){
        for i in 0...4 {
            var item = MainItem(text: "数据:\(i)", checked : true)
            arrData.append(item)
          //  println(item.text)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = arrData[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("maincell", forIndexPath: indexPath) as! UITableViewCell
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
        configureCheckmarkForCell(cell, item: item)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = arrData[indexPath.row]
        item.toggleChecked()
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        configureCheckmarkForCell(cell!, item: item)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        saveChecklistItems()
    }
    
    func configureCheckmarkForCell(cell:UITableViewCell,item:MainItem)
    {
        var label = cell.viewWithTag(1001) as! UILabel
        if item.checked {
            label.text = "√"
        }
        else{
            label.text = ""
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        arrData.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        saveChecklistItems()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let segueStr = segue.identifier
        if segueStr == "AddItem" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! MainListController
            controller.delegate = self
        }
        else if segueStr == "EditItem" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! MainListController
            controller.delegate = self
            let indexPath = self.tableView.indexPathForCell(sender! as! UITableViewCell)
            controller.itemToEdit = arrData[indexPath!.row]
        }
    }
    
    func addItemDidCancel(controller: MainListController) {
        controller.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addItem(controller: MainListController, didFinishAddingItem item: MainItem) {
        let newRowIndex = arrData.count
        arrData.append(item)
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        controller.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        saveChecklistItems()
    }
    
    func addItem(controller: MainListController,didFinishEditingItem item:MainItem)
    {
        self.tableView.reloadData()
        self.dismissViewControllerAnimated(true, completion: nil)
        saveChecklistItems()
    }
    
    
}
