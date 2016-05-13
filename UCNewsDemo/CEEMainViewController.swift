//
//  CEEMainViewController.swift
//  UCNewsDemo
//
//  Created by pro on 16/3/15.
//  Copyright © 2016年 CEE. All rights reserved.
//


/** swift 语法:
*  不用导入头文件
*  定义的属性可以直接调用,不用写 self   block 里面除外
*  此 DEMO 你不会看到几个 self
*  类型转换格式: 
*               类型(需要转换的值)   例如: NSInteger(tag)
*/

import UIKit

class CEEMainViewController: UIViewController,UIScrollViewDelegate {
    
    //MARK - 控件与相关数组
   internal var headScrollView        = UIScrollView()            /** 头部导航视图  */
   internal var MainScrollView        = UIScrollView()            /** 主滚动视图    */
   internal var indicatorView         = UIView()                  /** 指示器视图    */
   internal var headBtnArray          = NSArray()                 /** 头部按钮数组  */
   internal var viewControllrArray    = NSArray()
    
    
    //MARK: - 边距值
   public let mainScrollViewTop     : CGFloat = 100.0           /** 没有导航栏的时候将此值改为40 */
   public let headScrollViewTop     : CGFloat = 60.0            /** 没有导航栏的时候将此值改为0 */
    
    let headScrollViewHeight  : CGFloat = 40.0
    var headScrollViewWidth   : CGFloat = 0.0         /** 初始化时创建的值,后面会根据 headArray 的内容设置具体的值,此处0无实意 */
    let buttonWidth           : CGFloat = 100
    let buttonHeigth          : CGFloat = 40.0
    let screenHeigth          : CGFloat = UIScreen.mainScreen().bounds.size.height
    let screenWidth           : CGFloat = UIScreen.mainScreen().bounds.size.width
    let indicatorHeight       : CGFloat = 2.0
    var indicatorTop          : CGFloat = 0.0
    var indicatorLeftDistance : CGFloat = 0.0
    
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UC浏览器Demo"
        
        let btnArr            = ["深圳","科技","艺术","音乐","舞蹈"]
        
        let ControlsArr        = [CEEFirstViewController(),
                                  CEESecondViewController(),
                                  CEEThirdViewController(),
                                  CEEFourViewController(),
                                  CEEFiveViewController()]
        
        CEE_setupScrollviewWithHeaderBtnArr(btnArr, ControllersArr: ControlsArr)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func CEE_setupScrollviewWithHeaderBtnArr(headerBtnArr:NSArray, ControllersArr:NSArray) -> UIView  {
        
        headBtnArray       = headerBtnArr
        viewControllrArray = ControllersArr
        
        /** 取消autolayout功能 (要想scrollView滚动,必须取消autolayout) */
        automaticallyAdjustsScrollViewInsets = false
        
        addHeadScrollView()
        
        addMainScrollView()
        
        addIndicatorView()
        
        addButtonAndView()
        
        return view
    }
    
    //MARK: - 自定义方法
    /**  顶部导航滚动视图 */
    func addHeadScrollView () {
       
        /** UIScrollView
        *
        *  ScrollView.frame    指的是 UIScrollView 的可视范围
        *  contentSize         可滚动区域
        *  contentOffset       滚动当前位置,默认为0
        */
        headScrollViewWidth            = CGFloat(headBtnArray.count) * buttonWidth
        headScrollView                 = UIScrollView(frame: CGRectMake(0, headScrollViewTop, screenWidth, headScrollViewHeight))
        headScrollView.backgroundColor = UIColor.whiteColor()
        headScrollView.contentSize     = CGSizeMake(headScrollViewWidth, buttonHeigth)
        headScrollView.bounces         = false
        headScrollView.pagingEnabled   = true
        view.addSubview(headScrollView)
    }
    
    /**  主滚动视图      */
    func addMainScrollView () {
        
        MainScrollView = UIScrollView(frame: CGRectMake(0, mainScrollViewTop, screenWidth, screenHeigth - mainScrollViewTop))
        MainScrollView.contentSize     = CGSizeMake((CGFloat)(headBtnArray.count) * screenWidth, 0)
        MainScrollView.pagingEnabled   = true
        MainScrollView.delegate        = self
        MainScrollView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(MainScrollView)
    }
    
    /**  添加指示器      */
    func addIndicatorView () {
        
        indicatorTop  = buttonHeigth - indicatorHeight
        indicatorView = UIView(frame: CGRectMake(indicatorLeftDistance, indicatorTop, buttonWidth, indicatorHeight))
        indicatorView.backgroundColor = UIColor.blueColor()
        self.headScrollView.addSubview(indicatorView)
    }
    
    /**  添加按钮和主视图 */
    func addButtonAndView () {
        
        for index in 0..<headBtnArray.count
        {
            /**  button */
            let btn               = UIButton(type: UIButtonType.System)
            let leftBtnDistance   = (CGFloat(index) * buttonWidth + 0.0)
            
            btn.frame = CGRectMake(leftBtnDistance, 0, buttonWidth, headScrollViewHeight)
            btn.tag   = index + 0
            btn.setTitle(headBtnArray.objectAtIndex(index) as? String, forState: UIControlState.Normal)
            btn.addTarget(self, action: "headBtnAction:", forControlEvents: UIControlEvents.TouchUpInside)
            headScrollView.addSubview(btn)
            
            /** view */
            let leftViewDistance                   = CGFloat(index) * screenWidth
            viewControllrArray[index].view!!.frame = CGRectMake(leftViewDistance, 0, screenWidth, screenHeigth)
            
            /** addSubview */
            let controller :UIViewController = viewControllrArray[index] as! UIViewController
            MainScrollView.addSubview(controller.view)
        }
    }
    
    /** button 的点击事件 */
    func headBtnAction(button:UIButton){
        
        indicatorSettingWithTag(button.tag)
        
        let leftViewDistance = CGFloat(button.tag) * screenWidth

        switch button.tag
        {
        case 0..<headBtnArray.count :
            MainScrollView.setContentOffset(CGPointMake(leftViewDistance, 0), animated: true)
        default: break
        }
    }
    
    /** 指示器的显示 */
    func indicatorSettingWithTag(tag:NSInteger) {
        UIView.animateWithDuration(1.0) { () -> Void in
            self.indicatorLeftDistance        = (CGFloat(tag) * self.buttonWidth)
            self.indicatorView.frame.origin.x = self.indicatorLeftDistance
            self.view.layoutIfNeeded()
        }
    }
    
    
    // MARK: - scrollview delegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let tag = scrollView.contentOffset.x / screenWidth
        indicatorSettingWithTag(NSInteger(tag))
    }
    

}
