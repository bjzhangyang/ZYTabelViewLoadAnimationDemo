//
//  ZYViewController.swift
//  ZYTabelViewLoadAnimationDemo
//
//  Created by soufun on 15/6/18.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class ZYViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var direct : AnimationDirect!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "展示动画"
        self.tableView.reloadDataWithAnimate(direct, animationTime: 0.5, interval: 0.05)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "这是第\(indexPath.row)行"
        return cell!
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


