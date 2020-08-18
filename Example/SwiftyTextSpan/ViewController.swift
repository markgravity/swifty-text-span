//
//  ViewController.swift
//  SwiftyTextSpan
//
//  Created by markgravity on 03/21/2020.
//  Copyright (c) 2020 markgravity. All rights reserved.
//

import UIKit
import SwiftyTextSpan

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let string = TextSpan(
            text: "this is",
            style: TextStyle(color: .red)
        )
            .append(text: " ")
            .append(text: "blue", style: .color(.blue))
            .append(text: " then ")
            .append(text: "strikethrough", style: .strikethroughStyle(.styleSingle))
            .asAttributedString()
        
        label.attributedText = string
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

