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

let s = tree.description
print(s)
print("_____________")

//tree.traverseInOrder { (index) in
//    print(index)
//}
//print("_____________")
//tree.traversePreOrder { (index) in
//    print(index)
//}

tree.traverseHierarchy { (value) in
    print(value)
}


