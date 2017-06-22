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
    var weight:Float
    var name:String
    var imageName:String
    var imageData:Data
    var vac_1:Bool
    var vac_2:Bool
    var vac_3:Bool
}

var dogList:[Dog] = []
var chosenDog = 1

var urls:[String] = [   "http://www.kkc.or.kr",
                        "http://www.dog-zzang.co.kr",
                        "http://www.angel.or.kr"
                    ]

func calculateFeedWetDiet(weight:Float)-> String{
    
    var amountOfFood : Float = 0
    let tempWeight = Int(weight)
    var amountOfFoodPerCategory : String = ""
    
    switch tempWeight
    {
    case 0...4: amountOfFood = 345
    case 5: amountOfFood = 410
    case 6: amountOfFood = 470
    case 7: amountOfFood = 525
    case 8: amountOfFood = 580
    case 9: amountOfFood = 635
    case 10, 11: amountOfFood = 690
    case 12, 13: amountOfFood = 790
    case 14, 15: amountOfFood = 980
    case 16, 17: amountOfFood = 980
    case 18, 19: amountOfFood = 1070
    case 20, 21: amountOfFood = 1155
    case 22, 23: amountOfFood = 1240
    case 24, 25: amountOfFood = 1325
    case 24, 25: amountOfFood = 1410
    case 26, 27: amountOfFood = 1490
    case 28, 29: amountOfFood = 1570
    case 30, 31: amountOfFood = 1645
    case 32, 33: amountOfFood = 1720
    case 34, 35: amountOfFood = 1800
    case 36, 37: amountOfFood = 1870
    case 38, 39: amountOfFood = 1945
    case 40...44: amountOfFood = 45
    case 45...49: amountOfFood = 55
    case 50...54: amountOfFood = 55
    case 55...60: amountOfFood = 60
    default:
        amountOfFood = 60
        
        
    }
    
    amountOfFoodPerCategory = "100% Dry Diet: " + String(amountOfFood)
    return amountOfFoodPerCategory
}

func calculateFeedDryDiet(weight:Float)-> String{
    
    var amountOfFood : Float = 0
    let tempWeight = Int(weight)
    var amountOfFoodPerCategory : String = ""
    
    switch tempWeight
    {
    case 0...4: amountOfFood = 80
    case 5: amountOfFood = 100
    case 6: amountOfFood = 110
    case 7: amountOfFood = 125
    case 8: amountOfFood = 140
    case 9: amountOfFood = 150
    case 10, 11: amountOfFood = 165
    case 12, 13: amountOfFood = 190
    case 14, 15: amountOfFood = 210
    case 16, 17: amountOfFood = 230
    case 18, 19: amountOfFood = 255
    case 20, 21: amountOfFood = 275
    case 22, 23: amountOfFood = 295
    case 24, 25: amountOfFood = 315
    case 24, 25: amountOfFood = 335
    case 26, 27: amountOfFood = 350
    case 28, 29: amountOfFood = 370
    case 30, 31: amountOfFood = 390
    case 32, 33: amountOfFood = 410
    case 34, 35: amountOfFood = 425
    case 36, 37: amountOfFood = 445
    case 38, 39: amountOfFood = 460
    case 40...44: amountOfFood = 505
    case 45...49: amountOfFood = 545
    case 50...54: amountOfFood = 585
    case 55...60: amountOfFood = 625
    default:
        amountOfFood = 625
        
        
    }
    amountOfFoodPerCategory = "100% Wet Diet: " + String(amountOfFood)
    
    
    return amountOfFoodPerCategory
}

func calculateFeed(weight:Float)-> String{
    
    var dailyCalorie : Float = 0
    let tempWeight = Int(weight)
    var amountOfFoodPerCategory : String = ""
    
    switch tempWeight
    {
    case 0...4: dailyCalorie = 269
    case 5: dailyCalorie = 318
    case 6: dailyCalorie = 364
    case 7: dailyCalorie = 409
    case 8: dailyCalorie = 452
    case 9: dailyCalorie = 494
    case 10, 11: dailyCalorie = 534
    case 12, 13: dailyCalorie = 613
    case 14, 15: dailyCalorie = 688
    case 16, 17: dailyCalorie = 760
    case 18, 19: dailyCalorie = 830
    case 20, 21: dailyCalorie = 898
    case 22, 23: dailyCalorie = 965
    case 24, 25: dailyCalorie = 1030
    case 24, 25: dailyCalorie = 1094
    case 26, 27: dailyCalorie = 1156
    case 28, 29: dailyCalorie = 1218
    case 30, 31: dailyCalorie = 1278
    case 32, 33: dailyCalorie = 1338
    case 34, 35: dailyCalorie = 1396
    case 36, 37: dailyCalorie = 1454
    case 38, 39: dailyCalorie = 1511
    case 40...44: dailyCalorie = 1651
    case 45...49: dailyCalorie = 1786
    case 50...54: dailyCalorie = 1919
    case 55...60: dailyCalorie = 2048
    default:
        dailyCalorie = 2048
        
        
    }
    amountOfFoodPerCategory = "Daily Calorie Requirement: " + String(dailyCalorie)
    
    
    return amountOfFoodPerCategory
}

