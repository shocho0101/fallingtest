//
//  ViewController.swift
//  tst
//
//  Created by keisuke mitsumoto on 2015/11/25.
//  Copyright © 2015年 keisuke mitsumoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var x: CGFloat = CGFloat()
    var xArray: [CGFloat] = [100.0,200.0,300.0,400.0] //x座標の配列
    var y: CGFloat = 100.0 //y座標
    var timer: NSTimer!
    var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //二秒おきにImageViewを作る
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        timer.fire()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //ImageViewを作る機能
    func makeImageView(){
        
        //ランダムの機能　0~3から一つを選ぶ
        let randInt = Int(rand()%4)//0,1,2,3 の中から一つ
        NSLog("\(randInt)")
        
        //iamgeViewのサイズ
        testImageView = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        
        //表示位置
        testImageView.center = CGPointMake(xArray[randInt], y)
        
        //imageViewの色
        testImageView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        
        //画面にimageViewを追加する
        self.view.addSubview(testImageView)
    }


    //二秒おきにmakeImageVIewって動作を行う
    func onUpdate(timer : NSTimer){
        makeImageView()
    }

}

