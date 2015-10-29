//
//  ListDetailViewController.swift
//  推送
//
//  Created by 赵希帆 on 15/9/17.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate {
    func listDetailViewControllerDidCancel(controller : ListDetailViewController)
    func listDetailViewController(controllrt : ListDetailViewController,didFinishAddingChecklist checklist : Checklist)
    func listDetailViewController(controller : ListDetailViewController,didFinishEditingChecklist checklist : Checklist)
    
}


class ListDetailViewController: UITableViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var delegate : ListDetailViewControllerDelegate?
    var checklistToEdit : Checklist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if checklistToEdit != nil {
            self.title = "Edit Checklist"
            textField.text = checklistToEdit!.name
            doneButton.enabled = true
        }
        textField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.textField.becomeFirstResponder()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBAction func cancel(sender: AnyObject) {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done(sender: AnyObject) {
        if self.checklistToEdit == nil {
            let checklist = Checklist(name: textField.text!)
            delegate?.listDetailViewController(self, didFinishAddingChecklist: checklist)
        }
        else{
            checklistToEdit?.name = self.textField.text!
            delegate?.listDetailViewController(self, didFinishEditingChecklist: checklistToEdit!)
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let newText = textField.text!.stringByReplacingCharactersInRange(range.toRange(textField.text!), withString: string)
        doneButton.enabled = newText.characters.count > 0
        return true
    }
    
}
