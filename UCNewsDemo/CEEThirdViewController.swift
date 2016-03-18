//
//  CEEThirdViewController.swift
//  UCNewsDemo
//
//  Created by pro on 16/3/15.
//  Copyright © 2016年 CEE. All rights reserved.
//

import UIKit

class CEEThirdViewController: UIViewController,UITextFieldDelegate{

//    var textNum      : UITextField!
//    var textNumber   = UITextField()
//    var segDimension = UISegmentedControl()
//    var btn          : UIButton!
    var textNum      : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.yellowColor()
        
        let lable  = UILabel(frame: CGRectMake(0, 200, UIScreen.mainScreen().bounds.size.width, 80))
        lable.text = "这是第三个视图#^_^#..."
        lable.textAlignment = NSTextAlignment.Center
        lable.numberOfLines = 0
        view.addSubview(lable)
        
        
        
        
        let labelNum = ViewFactory.createLabel("赋值:")
        labelNum.frame = CGRectMake(100, 150, 60, 30)
        view.addSubview(labelNum)
        
        textNum = ViewFactory.createTextField("", action: nil, sender: self)
        textNum.frame = CGRectMake(100, 200, 200, 40)
        view.addSubview(textNum)
        
        
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textNum.resignFirstResponder()
        print(textNum.text)
        return true
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
