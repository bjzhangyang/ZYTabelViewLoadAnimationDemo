//
//  ViewController.swift
//  ZYTabelViewLoadAnimationDemo
//
//  Created by soufun on 15/6/18.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func clicked(sender: UIButton) {
        var direct:AnimationDirect = AnimationDirect.DropDownFromTop
        switch sender.tag{
        case 1:
            direct = AnimationDirect.DropDownFromTop
        case 2:
            direct = AnimationDirect.LiftUpFromBottum
        case 3:
            direct = AnimationDirect.FromRightToLeft
        case 4:
            direct = AnimationDirect.FromLeftToRight
        default:
            return
        }
        var target : ZYViewController = self.storyboard?.instantiateViewControllerWithIdentifier("tableView") as! ZYViewController
        target.direct = direct
        self.navigationController?.pushViewController(target, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

