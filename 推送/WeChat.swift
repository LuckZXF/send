//
//  WeChat.swift
//  推送
//
//  Created by 赵希帆 on 15/10/17.
//  Copyright © 2015年 赵希帆. All rights reserved.
//

import UIKit

class WeChat : UITableViewController {
    
        override func viewDidLoad() {
        super.viewDidLoad()
      //  self.navigationController?.navigationBar.tintColor = UIColor(red: 50/255.0, green: 138/255.0, blue: 233/255.0, alpha: 1.0)
        self.navigationItem.title = "发现"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16.0
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 6.0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Cell = "cell"
        print("swwww")
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(Cell)
        cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: Cell)
        if indexPath.section == 0 && indexPath.row == 0 {
            cell?.textLabel!.text = "朋友圈"
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell?.imageView?.image = UIImage(named: "q.png")
            let image1 = UIImage(named: "1.png")
            let imageview1 : UIImageView! = UIImageView(image : image1)
            imageview1.frame = CGRectMake(14, 5, 30, 30)
            cell!.contentView.addSubview(imageview1)
            
            return cell!

        }
        else if( indexPath.section == 1 && indexPath.row == 0 )
        {
            cell?.textLabel!.text = "扫一扫"
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell?.imageView?.image = UIImage(named: "q.png")
            let image1 = UIImage(named: "2.png")
            let imageview1 : UIImageView! = UIImageView(image : image1)
            imageview1.frame = CGRectMake(14, 5, 30, 30)
            cell!.contentView.addSubview(imageview1)
            
            return cell!
 
        }else if( indexPath.section == 1 && indexPath.row == 1 )
        {
            cell?.textLabel!.text = "摇一摇"
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell?.imageView?.image = UIImage(named: "q.png")
            let image1 = UIImage(named: "3.png")
            let imageview1 : UIImageView! = UIImageView(image : image1)
            imageview1.frame = CGRectMake(14, 5, 30, 30)
            cell!.contentView.addSubview(imageview1)
            
            return cell!
            
        }else if( indexPath.section == 2 && indexPath.row == 0 )
        {
            cell?.textLabel!.text = "附近的人"
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell?.imageView?.image = UIImage(named: "q.png")
            let image1 = UIImage(named: "4.png")
            let imageview1 : UIImageView! = UIImageView(image : image1)
            imageview1.frame = CGRectMake(14, 5, 30, 30)
            cell!.contentView.addSubview(imageview1)
            
            return cell!
            
        }else if( indexPath.section == 2 && indexPath.row == 1 )
        {
            cell?.textLabel!.text = "漂流瓶"
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell?.imageView?.image = UIImage(named: "q.png")
            let image1 = UIImage(named: "5.png")
            let imageview1 : UIImageView! = UIImageView(image : image1)
            imageview1.frame = CGRectMake(14, 5, 30, 30)
            cell!.contentView.addSubview(imageview1)
            
            return cell!
            
        }else if( indexPath.section == 3 && indexPath.row == 0 )
        {
            cell?.textLabel!.text = "购物"
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell?.imageView?.image = UIImage(named: "q.png")
            let image1 = UIImage(named: "6.png")
            let imageview1 : UIImageView! = UIImageView(image : image1)
            imageview1.frame = CGRectMake(14, 5, 30, 30)
            cell!.contentView.addSubview(imageview1)
            
            return cell!
            
        }
        else if( indexPath.section == 3 && indexPath.row == 1 )
        {
            cell?.textLabel!.text = "游戏"
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell?.imageView?.image = UIImage(named: "q.png")
            let image1 = UIImage(named: "7.png")
            let imageview1 : UIImageView! = UIImageView(image : image1)
            imageview1.frame = CGRectMake(14, 5, 30, 30)
            cell!.contentView.addSubview(imageview1)
            
            return cell!
            
        }
        else{
            return cell!
        }
       // return cell!
    }
}
