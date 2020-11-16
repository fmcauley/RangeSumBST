//
//  BinarySearchTree.swift
//  RangeSumBST
//
//  Created by Frank McAuley on 11/13/20.
//

import Foundation
class BinarySearchTree {
    
    var sum = 0
    
    var root: TreeNode
    
    init() {
        root = TreeNode()
    }
    
    func insert(value: Int) {
        
        guard root.val != 0 else {
            root.val = value
            return
        }
        
        var current = root
        
        while current.val != value {
            if value < current.val {
                if let currentLeft = current.left {
                    current = currentLeft
                } else {
                    let node = TreeNode()
                    node.val = value
                    current.left = node
                }
            } else {
                if let currentRight = current.right {
                    current = currentRight
                } else {
                    let node = TreeNode()
                    node.val = value
                    current.right = node
                }
            }
        }
    }
    
    func bulkInsert(_ values:[Int]) {
        for x in values {
            insert(value: x)
        }
    }
    
    func traverse(_ node: TreeNode, low: Int, hight: Int, _ transform: (Int) -> Int) -> Int {
        
        if let leftNode = node.left {
            _ = traverse(leftNode, low: low, hight: hight, transform)
        }
        
        if low <= node.val && node.val <= hight {
           
            sum = transform(node.val)
        }
        
        if let rightNode = node.right {
            _ = traverse(rightNode, low: low, hight: hight, transform)
        }
        return sum
    }
}
