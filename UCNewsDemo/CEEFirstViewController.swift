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
        
        /** 由于是使用 addChildView 方式添加的视图,
        * 所以此处的 self.navigationItem 赋值会被调用但主视图的中导航标题不会改变
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
