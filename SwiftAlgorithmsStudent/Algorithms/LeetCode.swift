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
    
    //MARK: k-th Largest (第k个最大元素)
    public func randomizedSelect<T: Comparable>(_ array: [T], order k: Int) -> T {
        var a = array
        
        func randomPivot<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> T {
            let pivotIndex:Int = Int(arc4random_uniform(UInt32(high) - UInt32(low)) + UInt32(low))
            a.swapAt(pivotIndex, high)
            return a[high]
        }
        
        func randomizedPartition<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> Int {
            let pivot = randomPivot(&a, low, high)
            var i = low
            for j in low..<high {
                if a[j] <= pivot {
                    a.swapAt(i, j)
                    i += 1
                }
            }
            a.swapAt(i, high)
            return i
        }
        
        func randomizedSelect<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int, _ k: Int) -> T {
            if low < high {
                let p = randomizedPartition(&a, low, high)
                if k == p {
                    return a[p]
                } else if k < p {
                    return randomizedSelect(&a, low, p - 1, k)
                } else {
                    return randomizedSelect(&a, p + 1, high, k)
                }
            } else {
                return a[low]
            }
        }
        
        precondition(a.count > 0)
        return randomizedSelect(&a, 0, a.count - 1, k)
    }

    

}
