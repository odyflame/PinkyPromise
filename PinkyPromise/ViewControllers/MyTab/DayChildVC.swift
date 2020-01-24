//
//  DayChildVC.swift
//  PinkyPromise
//
//  Created by kimhyeji on 1/14/20.
//  Copyright © 2020 hyejikim. All rights reserved.
//

import UIKit

struct Promise {
    let promiseName: String
    let promiseColor: String
}

struct Day {
    var day: Int
    var promise: [Promise]
}

class DayChildVC: UIViewController {
    
    @IBOutlet weak var dayTableView: UITableView!
    

    var days: [Day] = [
        Day(day: 0, promise: [
            Promise(promiseName: "red", promiseColor: "red"),
            Promise(promiseName: "yellow", promiseColor: "yellow")
        ]),
        Day(day: 1, promise: [
            Promise(promiseName: "yellow", promiseColor: "yellow"),
            Promise(promiseName: "green", promiseColor: "green"),
            Promise(promiseName: "blue", promiseColor: "blue"),
            Promise(promiseName: "purple", promiseColor: "purple"),
            Promise(promiseName: "blue", promiseColor: "blue"),
            Promise(promiseName: "green", promiseColor: "green"),
            Promise(promiseName: "systemPink", promiseColor: "systemPink")
        ]),
        Day(day: 2, promise: [
            Promise(promiseName: "purple", promiseColor: "purple"),
            Promise(promiseName: "green", promiseColor: "green"),
            Promise(promiseName: "systemPink", promiseColor: "systemPink")
        ])
    ]
    
//    var days: [Day] = [
//        Day(day: "MON  \n 1", promise: [
//            Promise(promiseName: "red", promiseColor: "red"),
//            Promise(promiseName: "yellow", promiseColor: "yellow")
//        ]),
//        Day(day: "TUE  \n 2", promise: [
//            Promise(promiseName: "yellow", promiseColor: "yellow"),
//            Promise(promiseName: "green", promiseColor: "green"),
//            Promise(promiseName: "blue", promiseColor: "blue"),
//            Promise(promiseName: "brown", promiseColor: "brown"),
//            Promise(promiseName: "blue", promiseColor: "blue"),
//            Promise(promiseName: "green", promiseColor: "green"),
//            Promise(promiseName: "blue", promiseColor: "blue")
//        ]),
//        Day(day: "WED  \n 3", promise: [
//            Promise(promiseName: "blue", promiseColor: "blue"),
//            Promise(promiseName: "green", promiseColor: "green"),
//            Promise(promiseName: "blue", promiseColor: "blue")
//        ])
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dayTableView.delegate = self
        self.dayTableView.dataSource = self
    
    }

}


extension DayChildVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dayTableView.dequeueReusableCell(withIdentifier: "DayTVC", for: indexPath) as! DayTVC
        cell.setPromise(day: self.days[indexPath.row])
        return cell
        
    }
    
}

extension DayChildVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height:CGFloat = CGFloat(self.days[indexPath.row].promise.count * 35 + 10)
        return height
        
    }
}

