//
//  ViewController.swift
//  TEst
//
//  Created by Hwang on 2020/02/07.
//  Copyright © 2020 Hwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var departLab : UILabel!
    var returnLab : UILabel!
    var departBtn : UIButton!
    var returnBtn : UIButton!
    var datePicker : UIDatePicker!
    
    var buttonTag : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // main backgroundColor
        view.backgroundColor = .white
        
        // departLabel
        departLab = UILabel()
        departLab.text = "departure Date"
        departLab.textAlignment = .center
        departLab.font = UIFont.boldSystemFont(ofSize: 20)
        departLab.textColor = .white
        departLab.backgroundColor = .lightGray
        departLab.layer.masksToBounds = true
        departLab.layer.cornerRadius = 10
        departLab.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(departLab)
        
        // returnLabels
        returnLab = UILabel()
        returnLab.text = "return Date"
        returnLab.textAlignment = .center
        returnLab.font = UIFont.boldSystemFont(ofSize: 20)
        returnLab.textColor = .white
        returnLab.backgroundColor = .lightGray
        returnLab.layer.masksToBounds = true
        returnLab.layer.cornerRadius = 10
        returnLab.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(returnLab)
        
        //departBtn
        departBtn = UIButton()
        departBtn.setTitle("Depart", for: .normal)
        departBtn.setTitleColor(.red, for: .normal)
        departBtn.backgroundColor = .white
        departBtn.clipsToBounds = true
        departBtn.layer.cornerRadius = 10
        departBtn.layer.borderWidth = 2
        departBtn.layer.borderColor = UIColor.red.cgColor
        departBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(departBtn)
        departBtn.addTarget(self, action: #selector(ShowPickerAction(_:)), for: .touchUpInside)
        departBtn.tag = 1
        
        // returnBtn
        returnBtn = UIButton()
        returnBtn.setTitle("Return", for: .normal)
        returnBtn.setTitleColor(.red, for: .normal)
        returnBtn.backgroundColor = .white
        returnBtn.clipsToBounds = true
        returnBtn.layer.cornerRadius = 10
        returnBtn.layer.borderWidth = 2
        returnBtn.layer.borderColor = UIColor.red.cgColor
        returnBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(returnBtn)
        returnBtn.addTarget(self, action: #selector(ShowPickerAction(_:)), for: .touchUpInside)
        returnBtn.tag = 2
                
        // DatePicker
        datePicker = UIDatePicker()
        datePicker.timeZone = NSTimeZone.local
//        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.backgroundColor = .white
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        datePicker.addTarget(self, action: #selector(selectedDateAction(_:)), for: .valueChanged)
        
        NSAutoLayout()
        
        datePicker.isHidden = true
    }
    
    
    func NSAutoLayout() {
        NSLayoutConstraint.activate([
            departLab.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            departLab.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            departLab.widthAnchor.constraint(equalToConstant: 220),
            departLab.heightAnchor.constraint(equalToConstant: 40),
            
            returnLab.topAnchor.constraint(equalTo: departLab.bottomAnchor, constant: 20),
            returnLab.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            returnLab.widthAnchor.constraint(equalToConstant: 220),
            returnLab.heightAnchor.constraint(equalToConstant: 40),
            
            departBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            departBtn.leadingAnchor.constraint(equalTo: departLab.trailingAnchor, constant: 20),
            departBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            departBtn.heightAnchor.constraint(equalToConstant: 40),
            
            returnBtn.topAnchor.constraint(equalTo: departBtn.bottomAnchor, constant: 20),
            returnBtn.leadingAnchor.constraint(equalTo: returnLab.trailingAnchor, constant: 20),
            returnBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            returnBtn.heightAnchor.constraint(equalToConstant: 40),
            
            datePicker.topAnchor.constraint(equalTo: returnBtn.bottomAnchor, constant: 50),
            datePicker.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            datePicker.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    @objc func ShowPickerAction(_ sender : UIButton) {
        if datePicker.isHidden == false {
            datePicker.isHidden = true
        }
        else {
            datePicker.isHidden = false
        }
        
        buttonTag = sender.tag
    }
    
    @objc func selectedDateAction(_ sender : UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-dd hh:mm"
        
        let dateString = formatter.string(from: sender.date)
        
        if buttonTag == 1 {
            departLab.text = dateString
            print(dateString)
        }
        else {
            returnLab.text = dateString
            print(dateString)
        }
        
    }
}


