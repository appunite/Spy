//
//  ViewController.swift
//  Example
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Cocoa
import Spy

class ViewController: NSViewController {
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        Environment.spy.log(level: .info, channel: .lifecycle, message: "initialized")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Environment.spy.log(level: .info, channel: .lifecycle, message: "initialized")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Environment.spy.log(level: .info, channel: .lifecycle, message: "ViewDidLoad")
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        Environment.spy.log(level: .info, channel: .lifecycle, message: "ViewDidAppear")
        Environment.spy.log(level: .severe, channel: .other, message: "ViewDidAppear not implemented")
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        Environment.spy.log(level: .warning, channel: .lifecycle, message: "ViewWillAppear")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}
