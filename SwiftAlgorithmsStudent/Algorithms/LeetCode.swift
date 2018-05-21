//
//  LeetCode.swift
//  SwiftAlgorithmsStudent
//
//  Created by kris on 2018/5/21.
//  Copyright © 2018年 lzf. All rights reserved.
//

import Foundation
class LeetCode {
    //MARK: 汉诺塔
    func hanio(n:Int , from:String ,to:String , other:String) {
        if n == 1 {
            print(from + "->" + to)
        }else{
            hanio(n: n-1, from: from, to: other, other: to)
            hanio(n: 1, from: from, to: to, other: other)
            hanio(n: n-1, from: other, to: to, other: from)
        }
    }
    
    //MARK:排好序的数组计算法摸一个元素出现的次数
    //改进的二分查找算法 计算一个排序好的数组中某一个元素出现的次数
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
        let low = leftBoundary()
        let right = rightBoundary()
        return right - low
    }

    

}
