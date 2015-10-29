//
//  MainItem.swift
//  推送
//
//  Created by 赵希帆 on 15/9/16.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit

class MainItem: NSObject {
    
    var text :String
    
    var checked : Bool
    
    init(text : String , checked : Bool){
        self.text = text
        self.checked = checked
    }
    
    func toggleChecked(){
        self.checked = !self.checked
    }
    
    init!(coder aDecoder: NSCoder!) {
        self.text = aDecoder.decodeObjectForKey("Text") as! String
        self.checked = aDecoder.decodeObjectForKey("Checked") as! Bool
        
    }
    
    func encodeWithCoder(aCoder : NSCoder!) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeObject(checked, forKey: "Checked")
    }
}
