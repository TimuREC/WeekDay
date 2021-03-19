//
//  ViewController.swift
//  WhatDay
//
//  Created by Timur Begishev on 17.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultTF: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func showDayName(_ sender: UIButton) {
        guard let day = Int(dayTF.text!),
              let month = Int(monthTF.text!),
              let year = Int(yearTF.text!),
              day < 32,
              day > 0,
              month > 0,
              month < 13,
              year > 0
              else { resultTF.text = "Дата введена некорректно"; return }
        
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE"
        dateFormat.locale = Locale(identifier: "ru_Ru")
        
        let weekday = dateFormat.string(from: date).capitalized
        
        resultTF.text = weekday
        
    }
    
}

