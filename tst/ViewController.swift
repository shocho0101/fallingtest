//
//  ViewController.swift
//  tst
//
//  Created by keisuke mitsumoto on 2015/11/25.
//  Copyright © 2015年 keisuke mitsumoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //上から降ってくるobjectのy座標
    var y0: CGFloat = 0.0
    var y1: CGFloat = 0.0
    var y2: CGFloat = 0.0
    var y3: CGFloat = 0.0
    
    //下から打ち出すobjectのy座標
    var yUp0: CGFloat = 450.0
    var yUp1: CGFloat = 450.0
    var yUp2: CGFloat = 450.0
    var yUp3: CGFloat = 450.0
    
    var timer: NSTimer!
    var downTimer: NSTimer!

    
    var testImageView0: UIImageView!
    var testImageView1: UIImageView!
    var testImageView2: UIImageView!
    var testImageView3: UIImageView!
    
    var upImageView0: UIImageView!
    var upImageView1: UIImageView!
    var upImageView2: UIImageView!
    var upImageView3: UIImageView!
    
    var upButton0: UIButton!
    var upButton1: UIButton!
    var upButton2: UIButton!
    var upButton3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //下から上へ向かうobjectを生成するためのボタン
        upButton0 = UIButton()
        upButton0.frame = CGRectMake(0,0,80,80)
        upButton0.backgroundColor = UIColor.redColor()
        upButton0.center = CGPointMake(80, 500)
        upButton0.tag = 0
        upButton0.addTarget(self, action: "onTapUpButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(upButton0)
        
        upButton1 = UIButton()
        upButton1.frame = CGRectMake(0,0,80,80)
        upButton1.backgroundColor = UIColor.redColor()
        upButton1.center = CGPointMake(180, 500)
        upButton1.tag = 1
        upButton1.addTarget(self, action: "onTapUpButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(upButton1)

        
        upButton2 = UIButton()
        upButton2.frame = CGRectMake(0,0,80,80)
        upButton2.backgroundColor = UIColor.redColor()
        upButton2.center = CGPointMake(280, 500)
        upButton2.tag = 2
        upButton2.addTarget(self, action: "onTapUpButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(upButton2)

        
        upButton3 = UIButton()
        upButton3.frame = CGRectMake(0,0,80,80)
        upButton3.backgroundColor = UIColor.redColor()
        upButton3.center = CGPointMake(380, 500)
        upButton3.tag = 3
        upButton3.addTarget(self, action: "onTapUpButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(upButton3)

        

        //二秒おきにImageViewを作る
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        timer.fire()
        
        downTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdateDown:", userInfo: nil, repeats: true)
        downTimer.fire()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ImageViewを落とす
    func fallDown() {
        if testImageView0 != nil {
            y0 = y0 + 1.0
            testImageView0.frame = CGRectMake(40, y0 , 80, 80)
            if y0 > 400 || y0 > yUp0 {    //条件：ある程度下に来たら消すor下から来たImageVIewと重なったら消す
                testImageView0.removeFromSuperview()
                y0 = 0
            }
        }
        
        if testImageView1 != nil {
            y1 = y1 + 1.0
            testImageView1.frame = CGRectMake(140, y1, 80, 80)
            
            if y1 > 400 || y1 > yUp1 {
                testImageView1.removeFromSuperview()
                y1 = 0
            }
        }
        
        if testImageView2 != nil {
            y2 = y2 + 1.0
            testImageView2.frame = CGRectMake(240, y2,80,80)
            
            if y2 > 400 || y2 > yUp2 {
                testImageView2.removeFromSuperview()
                y2 = 0
            }
        }
        
        if testImageView3 != nil {
            y3 = y3 + 1.0
            testImageView3.frame = CGRectMake(340, y3, 80, 80)
            
            if y3 > 400 || y3 > yUp3 {
                testImageView3.removeFromSuperview()
                y3 = 0
            }
        }
    }
    
    //ImageViewを上へ向けて打つ
    func up(){
        if upImageView0 != nil {
            yUp0 = yUp0 - 5.0
            upImageView0.frame = CGRectMake(40, yUp0, 80, 80)
            if yUp0 < 80 {
                upImageView0.removeFromSuperview()
                yUp0 = 500
            }
        }
        
        if upImageView1 != nil {
            yUp1 = yUp1 - 5.0
            upImageView1.frame = CGRectMake(140, yUp1, 80, 80)
            if yUp1 < 80 {
                upImageView1.removeFromSuperview()
                yUp1 = 500
            }
        }
        
        if upImageView2 != nil {
            yUp2 = yUp2 - 5.0
            upImageView2.frame = CGRectMake(240, yUp2, 80, 80)
            if yUp2 < 80 {
                upImageView2.removeFromSuperview()
                yUp2 = 500
            }
        }
        
        
        if upImageView3 != nil {
            yUp3 = yUp3 - 5.0
            upImageView3.frame = CGRectMake(340, yUp3, 80, 80)
            if yUp3 < 80{
                upImageView3.removeFromSuperview()
                yUp3 = 500
                
            }
        }
    }

    //二秒おきにimageViewを生成する
    func onUpdate(timer : NSTimer) {
        
        //ランダム　0~3から一つを選ぶ
        let randInt = Int(rand()%4)//0,1,2,3 の中から一つ
        NSLog("\(randInt)")
        
        switch randInt {
        case 0:
            makeImageView0()
        case 1:
            makeImageView1()
        case 2:
            makeImageView2()
        case 3:
            makeImageView3()
        default :
            break
        }
    }
    
    //imageViewを動かす
    func onUpdateDown(timer: NSTimer) {
        fallDown()
        up()
    }
    
    
    func onTapUpButton(sender: UIButton) {
        print(sender.tag)
        
        switch sender.tag {
        case 0:
            NSLog("up->0")
            makeUpImageView0()
        case 1:
            NSLog("up->1")
            makeUpImageView1()
        case 2:
            NSLog("up->2")
            makeUpImageView2()
        case 3:
            NSLog("up->3")
            makeUpImageView3()
        default:
            break
        }
    }
    
    
    //もっと効率の良いやり方があるはず・・・//
    //ImageViewを作る機能
    func makeImageView0() {
        
        if testImageView0 == nil {
        //y座標の初期化
        y0 = 0
        
        //imageViewのサイズ
        testImageView0 = UIImageView(frame: CGRectMake(40, 0, 80, 80))
        
        //表示位置
        testImageView0.center = CGPointMake(40, y0)
        
        //imageViewの色
        testImageView0.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        
        //画面にimageViewを追加する
        self.view.addSubview(testImageView0)
        }
    }
    
    
    
    func makeImageView1() {
        if testImageView1 == nil {
        //y座標の初期化
        y1 = 0
        
        //iamgeViewのサイズ
        testImageView1 = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        
        //表示位置
        testImageView1.center = CGPointMake(140, y1)
        
        //imageViewの色
        testImageView1.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
        
        //画面にimageViewを追加する
        self.view.addSubview(testImageView1)
        }
    }
    
    func makeImageView2() {
        if testImageView2 == nil {
        //y座標の初期化
        y2 = 0
        
        //iamgeViewのサイズ
        testImageView2 = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        
        //表示位置
        testImageView2.center = CGPointMake(240, y2)
        
        //imageViewの色
        testImageView2.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
        
        //画面にimageViewを追加する
        self.view.addSubview(testImageView2)
        }
    }
    
    func makeImageView3() {
        if testImageView3 == nil {
        
        //y座標の初期化
        y3 = 0
        //iamgeViewのサイズ
        testImageView3 = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        
        //表示位置
        testImageView3.center = CGPointMake(340, y3)
        
        //imageViewの色
        testImageView3.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.3)
        
        //画面にimageViewを追加する
        self.view.addSubview(testImageView3)
        }
    }
    
    //下から上へ打ち出すImageViewの生成
    func makeUpImageView0() {
        
        if upImageView0 != nil {
        upImageView0.removeFromSuperview()
        }
        
        yUp0 = 450
        
        upImageView0 = UIImageView(frame: CGRectMake(40, 450, 80, 80))

        upImageView0.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1)
        self.view.addSubview(upImageView0)
        }
    
    func makeUpImageView1() {
        
        if upImageView1 != nil {
        upImageView1.removeFromSuperview()
        }
        
        yUp1 = 450
        
        upImageView1 = UIImageView(frame: CGRectMake(140, 450, 80, 80))
        
        upImageView1.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1)
        
        self.view.addSubview(upImageView1)
    }
    
    func makeUpImageView2(){
        
        if upImageView2 != nil {
        upImageView2.removeFromSuperview()
        }
        
        yUp2 = 450
        
        upImageView2 = UIImageView(frame: CGRectMake(240, 450, 80, 80))
        
        //imageViewの色
        upImageView2.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1)
        
        //画面にimageViewを追加する
        self.view.addSubview(upImageView2)
    }
    
    func makeUpImageView3() {
        
        if upImageView3 != nil {
        upImageView3.removeFromSuperview()
        }
        
        yUp3 = 450
        
        //表示位置
        upImageView3 = UIImageView(frame: CGRectMake(340, 450, 80, 80))
        
        //imageViewの色
        upImageView3.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1)
        
        //画面にimageViewを追加する
        self.view.addSubview(upImageView3)
    }
}