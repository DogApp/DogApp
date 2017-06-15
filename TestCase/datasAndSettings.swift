//
//  datas.swift
//  TestCase
//
//  Created by 최광익 on 2017. 5. 23..
//  Copyright © 2017년 최광익. All rights reserved.
//

import Foundation

struct Dog{
    var age:Int
    var weight:Int
    var name:String
    var imageName:String
}

var dogList:[Dog] = [ Dog(age:3, weight:7, name:"pipi", imageName:"Dog1"),
                      Dog(age:3, weight:7, name:"pipi", imageName:"Dog1")
                    ]
var chosenDog = 1

var urls:[String] = [   "http://www.kkc.or.kr",
                        "http://www.dog-zzang.co.kr",
                        "http://www.angel.or.kr"
                    ]

func calculateFeed(weight:Int)->Double{
    return 33.33
}
