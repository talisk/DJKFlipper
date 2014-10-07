//
//  ViewController.swift
//  PageFlipper
//
//  Created by Daniel Koza on 10/2/14.
//  Copyright (c) 2014 Daniel Koza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FlipperDataSource {

    var flipperView:Flipper?
    var imageAndViewarray:[(view:UIView,snapshot:UIImage)]!  = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var page1 = PageTestViewController(nibName: "PageTestViewController", bundle: nil)
        page1.view.frame = self.view.bounds
        page1.backgroundImage.image = UIImage(named: "page1")
        
        var page2 = PageTestViewController(nibName: "PageTestViewController", bundle: nil)
        page2.view.frame = self.view.bounds
        page2.backgroundImage.image = UIImage(named: "page2")
        
        var page3 = PageTestViewController(nibName: "PageTestViewController", bundle: nil)
        page3.view.frame = self.view.bounds
        page3.backgroundImage.image = UIImage(named: "page3")
        
        imageAndViewarray = [(page1.view,page1.view.takeSnapshot()),(page2.view,page2.view.takeSnapshot()),(page3.view,page3.view.takeSnapshot())]
        
        flipperView = Flipper(frame: self.view.frame)
        flipperView?.dataSource = self
        self.view.addSubview(flipperView!)
     
    }
    
    func numberOfPages(flipper: Flipper) -> NSInteger {
        return imageAndViewarray.count
    }
    
    func imageForPage(page: NSInteger, fipper: Flipper) -> UIImage {
        return imageAndViewarray[page].snapshot
    }
    
    func viewForPage(page: NSInteger, flipper: Flipper) -> UIView {
        return imageAndViewarray[page].view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
