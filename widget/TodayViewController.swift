//
//  TodayViewController.swift
//  widget
//
//  Created by 将汰宮平 on 2017/03/25.
//  Copyright © 2017年 将汰宮平. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var JapaneseCalenderS: UILabel!
    @IBOutlet weak var JapaneseCalenderY: UILabel!
    @IBOutlet weak var zodiacIcon: UILabel!
    @IBOutlet weak var somewhatText: UILabel!
    @IBOutlet weak var weekText: UILabel!
    
    let formatter = DateFormatter()
    
    func getNowClockString() -> String {
        formatter.dateFormat = "yyyy年MM月dd日"
        let now = Date()
        return formatter.string(from: now)
    }
    
    func getJapaneseCalender() -> (s: String, y: String, Zodiac: String, Somewhat: String, Week: String) {
        formatter.dateFormat = "yyyy"
        let now = Date()
        let y = Int(formatter.string(from: now))
        var resultS = ""
        var resultY = ""
        var zodiac = ""
        var somewhat = ""
        var week = ""
        
        // 和暦
        if (y! > 1988) {
            resultS = "平成"
            resultY = String(y!-1988) + "年"
        } else if (y! > 1925) {
            resultS = "昭和"
            resultY = String(y!-1925) + "年"
        } else if (y! > 1911) {
            resultS = "大正"
            resultY = String(y!-1911) + "年"
        } else if (y! > 1867) {
            resultS = "明治"
            resultY = String(y!-1867) + "年"
        }
        
        // 干支
        var somewhatArray = ["庚","辛","壬","癸","甲","乙","丙","丁","戊","己"]
        var zodiacArray = ["🐵","🐔","🐶","🐗","🐭","🐮","🐯","🐰","🐲","🐍","🐴","🐏"]
        
        somewhat = somewhatArray[y! % 10]
        zodiac = zodiacArray[y! % 12]
        
        // 曜日
        formatter.dateFormat = "E"
        week = formatter.string(from: now)
        
        return (resultS, resultY, zodiac, somewhat, week)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        dateText.text = self.getNowClockString()
        
        let getJapaneseCalender = self.getJapaneseCalender()
        JapaneseCalenderS.text = getJapaneseCalender.s
        JapaneseCalenderY.text = getJapaneseCalender.y
        zodiacIcon.text = getJapaneseCalender.Zodiac
        somewhatText.text = getJapaneseCalender.Somewhat
        weekText.text = getJapaneseCalender.Week + "曜日"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        self.preferredContentSize = CGSize(width: 0, height: 100)
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
