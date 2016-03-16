//
//  CEEFourViewController.swift
//  UCNewsDemo
//
//  Created by pro on 16/3/15.
//  Copyright © 2016年 CEE. All rights reserved.
//

import UIKit

class CEEFourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let frame           = CGRectMake(0, 200, UIScreen.mainScreen().bounds.size.width, 80)
        let lable           = UILabel(frame: frame)
        lable.text          = "讲个冷笑话吧,从前有一个人,讲了一个冷笑话,然后冷死了..."
        lable.numberOfLines = 0
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
