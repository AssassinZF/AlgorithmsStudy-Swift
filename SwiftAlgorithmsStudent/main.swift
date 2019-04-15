//
//  main.swift
//  SwiftAlgorithmsStudent
//
//  Created by Daisy on 2018/1/7.
//  Copyright © 2018年 lzf. All rights reserved.
//

import Foundation

var numbers = [9,3,4,1,9,0,2,2,5,6]

var algorithms = AlgorithmsCode()

var tree = BinarySearchTree(array: numbers)


let cou = countOccurrencesOfKey(2, inArray: numbers)

print("\(cou) \n")
