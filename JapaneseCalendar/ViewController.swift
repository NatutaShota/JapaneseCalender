//
//  ViewController.swift
//  JapaneseCalendar
//
//  Created by 将汰宮平 on 2017/03/25.
//  Copyright © 2017年 将汰宮平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var japaneseCalenderText: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    private var bgImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getJapaneseCalender(yyyyDate: String) -> (String) {
        let y = Int(yyyyDate)
        print(y ?? "ok")
        var result = ""
        
        // 和暦
        if (y! > 1988) {
            result = "平成 " + String(y!-1988) + "年"
        } else if (y! > 1925) {
            result = "昭和 " + String(y!-1925) + "年"
        } else if (y! > 1911) {
            result = "大正 " + String(y!-1911) + "年"
        } else if (y! > 1867) {
            result = "明治 " + String(y!-1867) + "年"
        }
        
        return (result)
    }


    @IBAction func DateSelecter(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let yyyyDate = formatter.string(from: sender.date)
        let getJapaneseCalenderText = getJapaneseCalender(yyyyDate: yyyyDate)
        formatter.dateFormat = "yyyy年 MM月dd日"
        
        japaneseCalenderText.text = getJapaneseCalenderText
        dateLabel.text = formatter.string(from: sender.date)
    }

}

