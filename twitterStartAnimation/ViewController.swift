//
//  ViewController.swift
//  twitterStartAnimation
//
//  Created by Longwei on 16/11/1.
//  Copyright © 2016年 Longwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var snapshotView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let whiteView = UIView(frame: self.view.bounds)
        whiteView.backgroundColor = .white
        self.view.addSubview(whiteView)
        
        let birdView = UIImageView(frame: CGRect(origin: CGPoint (x: self.view.center.x - 50 , y:self.view.center.y - 50), size: CGSize(width: 100, height: 100)))
        print("frame = \(birdView.frame)")
        birdView.image = UIImage(named: "twitterLogo");
        self.view.addSubview(birdView)
        self.view.mask = birdView
        
        UIApplication.shared.delegate?.window??.backgroundColor = UIColor(red: 29 / 255.0, green: 161 / 255.0, blue: 242 / 255.0, alpha: 1)

        let myframe = birdView.frame.origin
        
        self.snapshotView.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            UIView.animateKeyframes(withDuration: 1, delay: 0,
                                    options: UIViewKeyframeAnimationOptions.calculationModeLinear,
                                    animations: {
                                        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                                            birdView.bounds = CGRect(x: myframe.x, y: myframe.y, width: 85, height: 85)
                                        })
                                        
                                        UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8, animations: {
                                            birdView.bounds = CGRect(x: myframe.x, y: myframe.y, width: 4500, height: 4500)
                                        })
                                        
            }, completion: {(_) in
                UIView.animate(withDuration: 0.2, animations: { 
                    whiteView.alpha = 0
                }, completion: { (_) in
                    whiteView.removeFromSuperview()
                    self.view.mask = nil
                    
                    UIView.animate(withDuration: 0.3, animations: {
                        self.snapshotView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                    }, completion: nil)
                })
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

