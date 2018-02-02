//
//  AlgorithmsImplement.swift
//  SwiftAlgorithmsStudent
//
//  Created by kris on 2018/2/2.
//  Copyright © 2018年 lzf. All rights reserved.
//

import Foundation

class AlgorithmsCode {
    var arrayList = [3,4,9,12,45,0,4,8,1,10];
    
    
    /*
     * 插入排序
     * 0(n2)
     */
    func insertionSort(array: [Int]) -> [Int] {
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && temp < a[y - 1] {
                a[y] = a[y - 1]                // 1
                y -= 1i
            }
            a[y] = temp                      // 2
        }
        return a
    }
    
    /*
     二分查找
     */
    
}
