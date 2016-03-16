//
//  CEESecondViewController.swift
//  UCNewsDemo
//
//  Created by pro on 16/3/15.
//  Copyright © 2016年 CEE. All rights reserved.
//

import UIKit

class CEESecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.grayColor()
        
        let lable  = UILabel(frame: CGRectMake(0, 200, UIScreen.mainScreen().bounds.size.width, 80))
        lable.text = "麻麻说给 star 的孩子是好孩子..."
        lable.textAlignment = NSTextAlignment.Center        
        view.addSubview(lable)
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
