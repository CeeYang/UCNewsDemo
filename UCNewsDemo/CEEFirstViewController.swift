//
//  CEEFirstViewController.swift
//  UCNewsDemo
//
//  Created by pro on 16/3/15.
//  Copyright © 2016年 CEE. All rights reserved.
//

import UIKit

class CEEFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightTextColor()
        
        let lable  = UILabel(frame: CGRectMake(0, 200, UIScreen.mainScreen().bounds.size.width, 80))
        lable.text = "这是第一个视图..."
        lable.textAlignment = NSTextAlignment.Center
        view.addSubview(lable)
        
        let arr = ["hhe","hhe"]
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
