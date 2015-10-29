//
//  MainListController.swift
//  推送
//
//  Created by 赵希帆 on 15/9/16.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

protocol MainListControllerDelegate {
    func addItemDidCancel (controller : MainListController)
    func addItem(controller:MainListController,didFinishAddingItem item : MainItem)
    func addItem(controller:MainListController,didFinishEditingItem item: MainItem)
}

class MainListController: UITableViewController , UITextFieldDelegate{
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    var delegate : MainListControllerDelegate?
    var itemToEdit : MainItem?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        if itemToEdit != nil {
            self.title = "编辑任务"
            self.textField.text = itemToEdit?.text
            self.doneButton.enabled = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancel(sender: AnyObject) {
        delegate?.addItemDidCancel(self)
    }
    
    @IBAction func done(sender: AnyObject) {
        if itemToEdit == nil {
            let item = MainItem(text: textField.text, checked: false)

            delegate?.addItem(self, didFinishAddingItem: item)
        }
        else{
            self.itemToEdit?.text = self.textField.text
            delegate?.addItem(self, didFinishEditingItem: self.itemToEdit!)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let newText = textField.text.stringByReplacingCharactersInRange(range.toRange(textField.text), withString: string)
        doneButton.enabled = count(newText) > 0
        return true
    }
    
}

extension NSRange
{
    func toRange(string : String) -> Range<String.Index>{
        let startIndex = advance(string.startIndex, self.location)
        let endIndex = advance(startIndex, self.length)
        return startIndex..<endIndex
    }
}
