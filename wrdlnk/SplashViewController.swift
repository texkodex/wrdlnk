//
//  SplashViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/29/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

open class SplashViewController: UIViewController {
    open var pulsing: Bool = false
    
    let animatedULogoView: AnimatedULogoView = AnimatedULogoView(frame: CGRect(x: 0.0, y: 0.0, width: 110.0, height: 64.0))
    var tileGridView: TileGridView!
    
    public init(tileViewFileName: String) {
        
        super.init(nibName: nil, bundle: nil)
        tileGridView = TileGridView(TileFileName: tileViewFileName)
        view.addSubview(tileGridView)
        tileGridView.frame = view.bounds
        
        view.addSubview(animatedULogoView)
        animatedULogoView.layer.position = view.layer.position
        
        tileGridView.startAnimating()
        animatedULogoView.startAnimating()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override var prefersStatusBarHidden : Bool {
        return true
    }
}

