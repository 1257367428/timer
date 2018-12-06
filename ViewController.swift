//
//  ViewController.swift
//  timer
//
//  Created by 20171105117 on 2018/11/29.
//  Copyright © 2018 20171105117. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var laps : [String] = []
    
    var timer = Timer()
    var minutes : Int = 0;
    var seconds : Int = 0;
    var fractions : Int = 0;
    
    var stopWatchString : String = ""
    var startStopWatch : Bool = true
    var addLap : Bool = false
    
    @IBOutlet var stopwatch_show: UILabel!
    
    @IBOutlet var start_Btn: UIButton!
    
    @IBOutlet var lap_btn: UIButton!
    
    @IBOutlet var lapsTblview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

