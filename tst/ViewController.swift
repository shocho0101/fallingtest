//
//  ViewController.swift
//  tst
//
//  Created by keisuke mitsumoto on 2015/11/25.
//  Copyright © 2015年 keisuke mitsumoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var y0: CGFloat = 0.0 //y座標
    var y1: CGFloat = 0.0
    var y2: CGFloat = 0.0
    var y3: CGFloat = 0.0
    
    var timer: NSTimer!
    var downTimer: NSTimer!

    
    var testImageView0: UIImageView!
    var testImageView1: UIImageView!
    var testImageView2: UIImageView!
    var testImageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //二秒おきにImageViewを作る
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        timer.fire()
        
        downTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdateDown:", userInfo: nil, repeats: true)
        downTimer.fire()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //もっと効率の良いやり方があるはず・・・//
    //ImageViewを作る機能
    func makeImageView0(){
        //y座標の初期化
        y0 = 0
        
        //iamgeViewのサイズ
        testImageView0 = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        
        //表示位置
        testImageView0.center = CGPointMake(100, y0)
        
        //imageViewの色
        testImageView0.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        
        //画面にimageViewを追加する
        self.view.addSubview(testImageView0)
        
        
    }
    
    func makeImageView1(){
        //y座標の初期化
        y1 = 0
        
        //iamgeViewのサイズ
        testImageView1 = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        
        //表示位置
        testImageView1.center = CGPointMake(200, y1)
        
        //imageViewの色
        testImageView1.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        
        //画面にimageViewを追加する
        self.view.addSubview(testImageView1)
        
        
    }
    
    func makeImageView2(){
        //y座標の初期化
        y2 = 0
        
        //iamgeViewのサイズ
        testImageView2 = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        
        //表示位置
        testImageView2.center = CGPointMake(300, y2)
        
        //imageViewの色
        testImageView2.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        
        //画面にimageViewを追加する
        self.view.addSubview(testImageView2)
        
    }
    
    func makeImageView3(){
        //y座標の初期化
        y3 = 0
        //iamgeViewのサイズ
        testImageView3 = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        
        //表示位置
        testImageView3.center = CGPointMake(400, y3)
        
        //imageViewの色
        testImageView3.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        
        //画面にimageViewを追加する
        self.view.addSubview(testImageView3)
    }
    
    
    func fallDown(){
        y0 = y0 + 5.0
        if testImageView0 != nil{
            testImageView0.frame = CGRectMake(100, y0 , 80, 80)
            if y0 > 400{
                testImageView0.removeFromSuperview()
                y0 = 0
            }
        }
        
        y1 = y1 + 5.0
        if testImageView1 != nil{
            testImageView1.frame = CGRectMake(200, y1, 80, 80)
            
            if y1 > 400{
                testImageView1.removeFromSuperview()
                y1 = 0
            }
        }
        
        y2 = y2 + 5.0
        if testImageView2 != nil{
            testImageView2.frame = CGRectMake(300, y2,80,80)
            
            if y2 > 400{
                testImageView2.removeFromSuperview()
                y2 = 0
            }
        }
        
        y3 = y3 + 5.0
        if testImageView3 != nil{
            testImageView3.frame = CGRectMake(400, y3, 80, 80)
            
            if y3 > 400{
                testImageView3.removeFromSuperview()
                
            }
        }
    }

    
    
//        //二秒おきにimageViewを生成する
    func onUpdate(timer : NSTimer){
        
        //ランダム　0~3から一つを選ぶ
        let randInt = Int(rand()%4)//0,1,2,3 の中から一つ
        NSLog("\(randInt)")
        
        switch randInt{
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
    
    //imageViewを下に落とす動作
    func onUpdateDown(timer: NSTimer){
        fallDown()
    }
}

