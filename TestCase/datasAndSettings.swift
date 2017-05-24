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
                      Dog(age:1, weight:6, name:"toto", imageName:"Dog2"),
                      Dog(age:4, weight:8, name:"dldl", imageName:"Dog3"),
                      Dog(age:7, weight:1, name:"emem", imageName:"Dog4"),
                      Dog(age:5, weight:6, name:"fefe", imageName:"Dog5")
                    ]
