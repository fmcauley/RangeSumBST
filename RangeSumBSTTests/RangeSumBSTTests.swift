//
//  RangeSumBSTTests.swift
//  RangeSumBSTTests
//
//  Created by Frank McAuley on 11/13/20.
//

import XCTest
@testable import RangeSumBST

class RangeSumBSTTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatBSTCanInsertValues() throws {
        let bst = BinarySearchTree()
        bst.insert(value: 10)
        let output = bst.root.val
        let expected = 10
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatBSTCanInsertThreeValuesAndThatTheLeftAndRightAreNotNil() {
        let bst = BinarySearchTree()
        bst.insert(value: 10)
        bst.insert(value: 5)
        bst.insert(value: 15)
        
        XCTAssertEqual(bst.root.val, 10)
        XCTAssertEqual(bst.root.left?.val, 5)
        XCTAssertEqual(bst.root.right?.val, 15)
    }

    func testThatBSTCanTraverseTheTreeUsingRecursion() {
        let bst = BinarySearchTree()
        let values = [10,5,15,3,7,18]
        bst.bulkInsert(values)
        var count = 0
        _ = bst.traverse(bst.root, low: 7, hight: 15) { (nodeValue:Int) -> Int in
            count += nodeValue
            return count
        }
        
        print(bst.sum)
    }


}
