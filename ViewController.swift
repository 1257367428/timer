//
//  ViewController.swift
//  timer
//
//  Created by 20171105117 on 2018/11/29.
//  Copyright © 2018 20171105117. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    var laps : [String] = []
    
    var timer = Timer()
    var minutes : Int = 0;
    var seconds : Int = 0;
    var fractions : Int = 0;
    
    var stopwatch_showString : String = ""
    var startstopwatch : Bool = true
    var addLap : Bool = false
    
    @IBOutlet var stopwatch_show: UILabel!
    
    @IBOutlet var start_Btn: UIButton!
    
    @IBOutlet var lap_btn: UIButton!
    
    @IBOutlet var lapsTblview: UITableView!
    
    @IBAction func StartStopBtn(_ sender: Any) {
        if startstopwatch == true{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(getter: stopwatch_show), userInfo: nil, repeats: true)
            startstopwatch = false
            start_Btn.setTitle(String("Stop"), for: UIControl.State.normal)
            lap_btn.setTitle(String("Lap"), for: UIControl.State.normal)
            
            addLap = true
        }else{
            timer.invalidate()
            startstopwatch = true
            start_Btn.setTitle(String("Start"), for: UIControl.State.normal)
            lap_btn.setTitle(String("Reset"), for: UIControl.State.normal)
            addLap = false
        }
    }
    
    @IBAction func timelapBtn(_ sender: Any) {
        if addLap == true{
            
            laps.insert(stopwatch_showString, at: 0)
            lapsTblview.reloadData()
        }else {
            addLap = false
            lap_btn.setTitle(String("Lap"), for: UIControl.State.normal)
            laps.removeAll(keepingCapacity: false)
            lapsTblview.reloadData()
            
            fractions = 0
            minutes = 0
            seconds = 0
            
            stopwatch_showString = "00.00.00"
            stopwatch_show.text = String(stopwatch_showString)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopwatch_show.text = String("00:00:00")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    //table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style : UITableViewCell.CellStyle.value1, reuseIdentifier : "Cell")
        cell.backgroundColor = self.view.backgroundColor
        cell.textLabel?.text = "Lap \(laps.count - indexPath.row)"
        cell.detailTextLabel?.text = laps[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    
    
    @objc func updateStopwatch(){
        fractions += 1
        if fractions == 100{
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopwatch_showString = "\(minutesString):\(secondsString): \(fractionsString)"
        stopwatch_show.text = String(stopwatch_showString)
    }
    
    
}


    

    






