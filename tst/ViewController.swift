//
//  ViewController.swift
//  tst
//
//  Created by keisuke mitsumoto on 2015/11/25.
//  Copyright © 2015年 keisuke mitsumoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var x: CGFloat = CGFloat()
    var y: CGFloat = 100.0
    var timer: NSTimer!
    var ytimer: NSTimer!
    var testLabel: UILabel!
    var counter: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        timer.fire()
        
        ytimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdateY:", userInfo: nil, repeats: true)
        ytimer.fire()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeLabel(){
        testLabel = UILabel(frame: CGRectMake(0, 0, 40, 40))
        testLabel.center = CGPointMake(x, y)//表示位置
        testLabel.textAlignment = NSTextAlignment.Center
//        testLabel.textColor = UIColor.blueColor()
        testLabel.backgroundColor = UIColor.blueColor()
        self.view.addSubview(testLabel)
    }


    func onUpdate(timer : NSTimer){

        x = CGFloat(counter)
        NSLog("x,y -> \(x)\(y)")
        makeLabel()
        counter += 50.0
    }
    
    func onUpdateY(timer: NSTimer){
        var ycounter: CGFloat = 0.0
        ycounter += 1.0
        y = y + ycounter
        
    }
}

