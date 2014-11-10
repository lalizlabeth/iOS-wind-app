//
//  ViewController.swift
//  wind
//
//  Created by Elizabeth Lin on 11/9/14.
//  Copyright (c) 2014 Elizabeth Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let rangeSlider = RangeSlider(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Breeze"
        
    }
    
    @IBAction func openButton(sender: UIButton) {
        self.speed.text = "hello"
    }
    
    @IBAction func closeButton(sender: UIButton) {
        
    }
    
    @IBOutlet weak var speed: UILabel!
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider.frame = CGRect(x: margin, y: margin + topLayoutGuide.length,
            width: width, height: 31.0)
    }
    
    func rangeSliderValueChanged(rangeSlider: RangeSlider) {
        println("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))")
    }
}