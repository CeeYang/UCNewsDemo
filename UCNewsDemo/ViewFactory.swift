//
//  ViewFactory.swift
//  UCNewsDemo
//
//  Created by pro on 16/3/17.
//  Copyright © 2016年 CEE. All rights reserved.
//

import UIKit

class ViewFactory: NSObject
{
    
    
    
    
    /**
     * 工厂方法测试:
     *
     *      创建:  class func MethordName () -> anyobject {}
     *      使用:  currentClass.MethordName()
     */
    
    
    
    
    /**
    *  控件默认尺寸
    */
    class func getDefaultFrame() -> CGRect {
        let defaultFrame = CGRectMake(0, 0, 100, 30)
        return defaultFrame
    }
    
    class func createControl(type:String, title: [String], action:Selector, sender:AnyObject) -> UIView {
        switch type
        {
        case "label" :
            return ViewFactory.createLabel(title[0])
        case "button" :
            return ViewFactory.createButton(title[0], action: action, sender: sender as! UIViewController)
        case "text" :
            return ViewFactory.createTextField(title[0], action: action, sender: sender as! UITextFieldDelegate )
        case "segment" :
            return ViewFactory.createSegment(title, action: action, sender: sender as! UIViewController)
        default:
            return ViewFactory.createLabel(title[0])
        }
    }
    
    
    /**
     * 创建按钮控件
     */
    class func createButton(title:String, action: Selector, sender: UIViewController) -> UIButton {
        let button                   = UIButton(frame: ViewFactory.getDefaultFrame())
        button.backgroundColor       = UIColor.blueColor()
        button.titleLabel?.textColor = UIColor.whiteColor()
        button.titleLabel?.font      = UIFont.systemFontOfSize(14)
        button.setTitle(title, forState: .Normal)
        button.addTarget(sender, action: action, forControlEvents: .TouchUpInside)
        return button
    }
    
    /**
     * 创建文本标签控件
     */
    class func createLabel(title: String) -> UILabel  {
        let label               = UILabel(frame: ViewFactory.getDefaultFrame())
        label.textColor         = UIColor.blackColor()
        label.backgroundColor   = UIColor.whiteColor()
        label.text              = title
        label.font              = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return label
    }
    
    /**
     *  创建文本输入框控件
     */
    class func createTextField(value: String, action: Selector, sender: UITextFieldDelegate) -> UITextField {
        let textField             = UITextField(frame: ViewFactory.getDefaultFrame())
        textField.backgroundColor = UIColor.clearColor()
        textField.textColor       = UIColor.blackColor()
        textField.text            = value
        textField.borderStyle     = UITextBorderStyle.RoundedRect
        textField.delegate        = sender
        textField.adjustsFontSizeToFitWidth = true
        return textField
    }
    
    /**
     * 创建分段单选控件
     */
    class func createSegment(items: [String], action:Selector, sender:UIViewController)
        ->UISegmentedControl
    {
        let segment       = UISegmentedControl(items:items)
        segment.frame     = ViewFactory.getDefaultFrame()
        segment.momentary = false
        segment.addTarget(sender, action:action, forControlEvents:.ValueChanged)
        return segment
    }
    

}
