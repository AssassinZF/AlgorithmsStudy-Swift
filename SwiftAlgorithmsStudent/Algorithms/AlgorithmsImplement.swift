//
//  AlgorithmsImplement.swift
//  SwiftAlgorithmsStudent
//
//  Created by kris on 2018/2/2.
//  Copyright © 2018年 lzf. All rights reserved.
//

import Foundation

//MARK: 基本算法

class AlgorithmsCode {
    var arrayList = [3,4,9,12,45,0,4,8,1,10];
    
    //MARK: 插入排序
    /*
     * 插入排序
     * 0(n^2)
     */
    func insertionSort(array: [Int]) -> [Int] {
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && temp < a[y - 1] {
                a[y] = a[y - 1]                // 1
                y -= 1
            }
            a[y] = temp                      // 2
        }
        return a
    }
    
    //MARK: 二分查找
    /*
     * 二分查找
     * 要求：必须是排好序的数组
     * O(nlgn):
     */
    func binarySearch<T: Comparable>(a: [T], key: T) -> Int? {
        var left = a.startIndex
        var right = a.endIndex - 1
        while left < right {
            let midIndex = left + (right - left) / 2
            if a[midIndex] == key {
                return midIndex
            } else if a[midIndex] < key {
                left = midIndex + 1
            } else {
                right = midIndex
            }
        }
        return nil
    }
    
    func recursionBinarySearch<T:Comparable>(a:[T],key:T,rang:Range<Int>) -> Int? {
        if rang.lowerBound > rang.upperBound {
            return nil
        }
        let mind = rang.lowerBound + (rang.upperBound - rang.lowerBound)/2
        if a[mind] < key {
            return recursionBinarySearch(a: a, key: key, rang: mind + 1 ..< rang.upperBound)
        }else if a[mind] > key{
            return recursionBinarySearch(a: a, key: key, rang: 0 ..< mind)
        }
        return mind
    }
    
    //MARK: 归并排序
    /*
     * 归并排序
     * 0(nlgn)
     */
    func mergeSort(array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }    // 1
        
        let middleIndex = array.count / 2              // 2
        
        let leftArray = mergeSort(array: Array(array[0..<middleIndex]))             // 3
        
        let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))  // 4
        
        return merge(lp: leftArray, rightPile: rightArray)             // 5
    }
    
    func merge(lp leftPile: [Int], rightPile: [Int]) -> [Int] {
        // 1
        var leftIndex = 0
        var rightIndex = 0
        
        // 2
        var orderedPile = [Int]()
        
        // 3
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        
        // 4
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderedPile
    }
        
    
}
