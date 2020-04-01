//
//  AnimationButton.swift
//  Timer
//
//  Created by 加藤りさ子 on 3/30/20.
//  Copyright © 2020 Risako Kato. All rights reserved.
//

import UIKit

class AnimationButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchStartAnimation()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchEndAnimation()
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        touchEndAnimation()
    }
}

extension AnimationButton {

    //影付きのボタンの生成
    internal func commonInit(){
        let buttonX = Int(UIScreen.main.bounds.size.width*0.45)
        let buttonY = Int(UIScreen.main.bounds.size.height*0.52)
        self.frame = CGRect(x: buttonX, y: buttonY, width: 180, height: 180)
        self.layer.cornerRadius = 90
        self.layer.shadowOffset = CGSize(width: 2, height: 6)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.titleLabel?.numberOfLines = 0
        self.titleLabel!.textAlignment = NSTextAlignment.center
        self.titleEdgeInsets = UIEdgeInsets(top: 11, left: 2, bottom: 0, right: 0);
        self.setTitle("", for: .normal)
    }

    //ボタンが押された時のアニメーション
    internal func touchStartAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {() -> Void in
            self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97);
            self.alpha = 0.9
        },completion: nil)
    }

    //ボタンから手が離れた時のアニメーション
    internal func touchEndAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {() -> Void in
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
            self.alpha = 1
        },completion: nil)
    }
}
