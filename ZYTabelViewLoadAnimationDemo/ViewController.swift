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


    @IBAction func clicked(_ sender: UIButton) {
        var direct:AnimationDirect = AnimationDirect.dropDownFromTop
        switch sender.tag{
        case 1:
            direct = AnimationDirect.dropDownFromTop
        case 2:
            direct = AnimationDirect.liftUpFromBottum
        case 3:
            direct = AnimationDirect.fromRightToLeft
        case 4:
            direct = AnimationDirect.fromLeftToRight
        default:
            return
        }
        let target : ZYViewController = self.storyboard?.instantiateViewController(withIdentifier: "tableView") as! ZYViewController
        target.direct = direct
        self.navigationController?.pushViewController(target, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

