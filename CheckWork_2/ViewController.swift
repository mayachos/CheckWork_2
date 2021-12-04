//
//  ViewController.swift
//  CheckWork_2
//
//  Created by maya on 2021/12/04.
//

import UIKit

class ViewController: UIViewController {
    
    // カウントする数字のLabelを宣言
    @IBOutlet var countLabel: UILabel!
    // カウントする変数を宣言
    var count: Int = 0
    
    
    // ハート表示のための宣言
    var imageView: UIImageView!
    let image = UIImage(named: "heart.png")!
    // 止まった画像位置を保存するための配列
    var x_ran_Array: [CGFloat] = []
    var y_ran_Array: [CGFloat] = []
    // ハートの個数
    var heartCount = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addHeart() {
        
        // カウントを+1する
        count = count + 1
        // カウントをLabelに反映する
        countLabel.text = String(count)
        
        // ハートが出てくるメソッド
        self.heartView()
    }
    
    
    func heartView() {
        // 画像をハートに設定
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        // x軸, y軸の値をランダムで決定
        let x_ran = CGFloat.random(in: 0..<self.view.frame.width)
        let y_ran = CGFloat.random(in: 20..<self.view.frame.height)
        // 画像を画面の下に配置
        imageView.center = CGPoint(x: x_ran, y: self.view.frame.height)
        // 画面上に画像を表示させる
        self.view.addSubview(imageView)
        
        // 1秒間のアニメーションを設定
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            // 画像が止まる位置を決定
            self.imageView.center.y -= y_ran
        })
        // アニメーションを開始
        animator.startAnimation()
        // 止まった画像の座標位置を配列に追加
        x_ran_Array.append(x_ran)
        y_ran_Array.append(self.view.frame.height - y_ran)
        for i in 0..<heartCount {
            // 止まった画像を表示
            var imageViews: UIImageView!
            imageViews = UIImageView(image: image)
            imageViews.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            imageViews.center = CGPoint(x: x_ran_Array[i], y: y_ran_Array[i])
            self.view.addSubview(imageViews)
        }
        heartCount += 1
    }


}

