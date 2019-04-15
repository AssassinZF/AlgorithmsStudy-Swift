//
//  CountNumber.swift
//  SwiftAlgorithmsStudent
//
//  Created by kris on 2019/4/15.
//  Copyright © 2019 lzf. All rights reserved.
//

import Foundation

//MARK:数组中一个值出现次数问题
func countOccurrencesOfKey(_ key: Int, inArray a: [Int]) -> Int {
    func leftBoundary() -> Int {
        var low = 0
        var high = a.count
        while low < high {
            let midIndex = low + (high - low)/2
            if a[midIndex] < key {
                low = midIndex + 1
            } else {
                high = midIndex
            }
        }
        return low
    }
    
    func rightBoundary() -> Int {
        var low = 0
        var high = a.count
        while low < high {
            let midIndex = low + (high - low)/2
            if a[midIndex] > key {
                high = midIndex
            } else {
                low = midIndex + 1
            }
        }
        return low
    }
    
    return rightBoundary() - leftBoundary()
}

