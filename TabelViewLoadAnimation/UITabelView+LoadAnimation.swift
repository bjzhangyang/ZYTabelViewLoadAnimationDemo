//
//  UITabelView+VerticalAnimation.swift
//  ZYTabelVIewVerticalAnimationDemo
//
//  Created by soufun on 15/6/18.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

import Foundation
import UIKit
enum AnimationDirect{
   case dropDownFromTop
   case liftUpFromBottum
   case fromRightToLeft
   case fromLeftToRight
}
extension UITableView {
    /**
    *  UITableView重新加载动画
    *
    *  @param   direct    cell运动方向
    *  @param   time      动画持续时间，设置成1.0
    *  @param   interval  每个cell间隔，设置成0.1
    *  @example self.tableView.reloadDataWithAnimate(AnimationDirect.DropDownFromTop, animationTime: 0.5, interval: 0.05)
    */
    func reloadDataWithAnimate(_ direct:AnimationDirect,animationTime:TimeInterval,interval:TimeInterval)->Void{
        self.setContentOffset(self.contentOffset, animated: false)
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.isHidden = true
            self.reloadData()
        }, completion: { (finished) -> Void in
            self.isHidden = false
            self.visibleRowsBeginAnimation(direct, animationTime: animationTime, interval: interval)
        }) 
    }
    func visibleRowsBeginAnimation(_ direct:AnimationDirect,animationTime:TimeInterval,interval:TimeInterval)->Void{
        let visibleArray : NSArray = self.indexPathsForVisibleRows! as NSArray
        let count =  visibleArray.count
        switch direct{
        case .dropDownFromTop:
            for i in 0...(count-1){
                let path : IndexPath = visibleArray.object(at: count - 1 - i) as! IndexPath
                let cell : UITableViewCell = self.cellForRow(at: path)!
                cell.isHidden = true
                let originPoint : CGPoint = cell.center
                cell.center = CGPoint(x: originPoint.x, y: originPoint.y - 1000)
                UIView.animate(withDuration: animationTime + TimeInterval(i) * interval, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                    cell.center = CGPoint(x: originPoint.x ,  y: originPoint.y + 2.0)
                    cell.isHidden = false
                    }, completion: { (finished) -> Void in
                        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                            cell.center = CGPoint(x: originPoint.x ,  y: originPoint.y - 2.0)
                            }, completion: { (finished) -> Void in
                                UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                                    cell.center = originPoint
                                    }, completion: { (finished) -> Void in
                                        
                                })
                        })

                })
            }
        case .liftUpFromBottum:
            for i in 0...(count-1){
                let path : IndexPath = visibleArray.object(at: i) as! IndexPath
                let cell : UITableViewCell = self.cellForRow(at: path)!
                cell.isHidden = true
                let originPoint : CGPoint = cell.center
                cell.center = CGPoint(x: originPoint.x, y: originPoint.y + 1000)
                UIView.animate(withDuration: animationTime + TimeInterval(i) * interval, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                    cell.center = CGPoint(x: originPoint.x ,  y: originPoint.y - 2.0)
                    cell.isHidden = false
                    }, completion: { (finished) -> Void in
                        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                            cell.center = CGPoint(x: originPoint.x ,  y: originPoint.y + 2.0)
                            }, completion: { (finished) -> Void in
                                UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                                    cell.center = originPoint
                                    }, completion: { (finished) -> Void in
                                        
                                })
                        })
                })
            }
        case .fromLeftToRight:
            for i in 0...(count-1){
                let path : IndexPath = visibleArray.object(at: i) as! IndexPath
                let cell : UITableViewCell = self.cellForRow(at: path)!
                cell.isHidden = true
                let originPoint : CGPoint = cell.center
                cell.center = CGPoint(x: -cell.frame.size.width,  y: originPoint.y)
                UIView.animate(withDuration: animationTime + TimeInterval(i) * interval, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                    cell.center = CGPoint(x: originPoint.x - 2.0,  y: originPoint.y)
                    cell.isHidden = false;
                }, completion: { (finished) -> Void in
                    UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                        cell.center = CGPoint(x: originPoint.x + 2.0,  y: originPoint.y)
                    }, completion: { (finished) -> Void in
                        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                            cell.center = originPoint
                            }, completion: { (finished) -> Void in
                                
                        })
                    })
                })
            }
        case .fromRightToLeft:
            for i in 0...(count-1){
                let path : IndexPath = visibleArray.object(at: i) as! IndexPath
                let cell : UITableViewCell = self.cellForRow(at: path)!
                cell.isHidden = true
                let originPoint : CGPoint = cell.center
                cell.center = CGPoint(x: cell.frame.size.width * 3.0,  y: originPoint.y)
                UIView.animate(withDuration: animationTime + TimeInterval(i) * interval, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                    cell.center = CGPoint(x: originPoint.x + 2.0,  y: originPoint.y)
                    cell.isHidden = false;
                    }, completion: { (finished) -> Void in
                        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                            cell.center = CGPoint(x: originPoint.x - 2.0,  y: originPoint.y)
                            }, completion: { (finished) -> Void in
                                UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                                    cell.center = originPoint
                                    }, completion: { (finished) -> Void in
                                        
                                })
                        })
                })

            }
        
        }
        
    }

}
