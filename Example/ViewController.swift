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
    @Spied(spy: Environment.spy, onLevel: .severe, onChannel: .foo) var text = "text"
    
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        Environment.spy.log(level: .info, channel: .foo, message: "initialized")
        Environment.spy.log(level: .severe, channel: .bar, message: "provide initializer implementation")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Environment.spy.log(level: .info, channel: .foo, message: "initialized")
        Environment.spy.log(level: .severe, channel: .bar, message: "provide initializer implementation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Environment.spy.log(level: .info, channel: .foo, message: "ViewDidLoad")
        Environment.spy.log(level: .severe, channel: .foo, message: "provide ViewDidLoad implementation")
        text = "abc"
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        Environment.spy.log(level: .info, channel: .foo, message: "ViewDidAppear")
        Environment.spy.log(level: .severe, channel: .bar, message: "provide ViewDidAppear implementation")
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        Environment.spy.log(level: .warning, channel: .foo, message: "ViewWillAppear")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}
