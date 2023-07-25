//
//  DateViewController.swift
//  NewlyCoinedword
//
//  Created by 정경우 on 2023/07/20.
//

import UIKit

class DateViewController: UIViewController {
    
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var background: UIImageView!
    @IBOutlet var date100Label: UILabel!
    @IBOutlet var dateTodayLabel: UILabel!
    @IBOutlet var date200Label: UILabel!
   
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designDatePicker()
        testViewproperty()
        datePickerValueChanged(datePicker)
        // 사용자가 클릭한것처럼 앱실행되면 바로 레이블에 실행
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        // print(sender.date)
        
        //100일 뒤
       let result100 = Calendar.current.date(byAdding: .day, value: 100, to: sender.date)
        let resultToday = sender.date
        let result200 = Calendar.current.date(byAdding: .day, value: 200, to: sender.date)
        
        //DateFormatter: 1. 시간대변경 2. 날짜 포맷 변경
        
        format.dateFormat = "MM월 dd일 yyyy년"
        
        let value100 = format.string(from: result100!)
        let valueToday = format.string(from: sender.date)
        let value200 = format.string(from: result200!)
        
        date100Label.text = value100
        dateTodayLabel.text = valueToday
        date200Label.text = value200

      
        
    }
    
    func testViewproperty() {
        background.layer.cornerRadius = 20
        
        
        background.layer.shadowColor = UIColor.black.cgColor
        background.layer.shadowOffset = .zero  //햇빛이 비치는 방향
        background.layer.shadowRadius = 40 //그림자 크기
        background.layer.shadowOpacity = 0.5 //불투명도
        background.clipsToBounds = true
        
        date200Label.layer.cornerRadius = 20
        date200Label.clipsToBounds = true

        date100Label.layer.cornerRadius = 30
        date100Label.clipsToBounds = true
        
        dateTodayLabel.layer.shadowOffset = .zero
        dateTodayLabel.layer.shadowRadius = 50
        dateTodayLabel.layer.shadowColor = UIColor.black.cgColor
        dateTodayLabel.layer.shadowOpacity = 0.8
    }
    
    
    
    func designDatePicker() {
        
        datePicker.tintColor = .systemPink
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline //wheel 예전방식

        } else {
            datePicker.preferredDatePickerStyle = .wheels

        }

    }
        
}
    
