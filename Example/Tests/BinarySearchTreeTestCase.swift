//
//  BinarySearchTreeTestCase.swift
//  CoreDataStructures_Tests
//
//  Created by Michael Cordero on 10/1/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import CoreDataStructures

class BinarySearchTreeTestCase: XCTestCase {
    
    // MARK: - Test Object
    var tree: BinarySearchTree<Int> = BinarySearchTree<Int>(rootNodeValue: 10)
    
    // MARK: - XCTestCase
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try! tree.put(3)
        try! tree.put(5)
        try! tree.put(21)
        try! tree.put(1)
        try! tree.put(6)
        try! tree.put(22)
        try! tree.put(14)
        try! tree.put(13)
        try! tree.put(20)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Functional Tests
    
    func testSearchString() {
        let tree = BinarySearchTree<String>.init(rootNodeValue: "")
        try! tree.put("hello")
        try! tree.put("my")
        try! tree.put("name")
        try! tree.put("is")
        try! tree.put("neuro")
        
        var val = tree.get("is")?.value
        XCTAssertNotNil(val)
        XCTAssertTrue(val == "is")
        
        val = tree.get("nigga")?.value
        XCTAssertNil(val)
    }
    
    func testRetrieveValue() {
        let testValue: Int = 3
        let val = tree.get(testValue)
        
        XCTAssert(testValue == val?.value)
    }
    
    func testAddValidValue() {
        let testValue: Int = 32
        print("Existing values: \(tree.values())")
        print("Test value: \(testValue)")
        XCTAssertNoThrow(try tree.put(testValue))
        print("Updated values: \(tree.values())")
    }
    
    func testAddPreExistingValue() {
        let testValue: Int = 5
        print("Existing values: \(tree.values())")
        print("Test value: \(testValue)")
        XCTAssertThrowsError(try tree.put(testValue))
        print("Updated values: \(tree.values())")
    }
    
    func testRemoveValidValue() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print("Current values: \(tree.values())")
        let testNode: BinarySearchTree<Int>.Node<Int> = BinarySearchTree<Int>.Node<Int>(value: 20)
        print("Value to be removed: \(testNode)")
        let removedNode: BinarySearchTree<Int>.Node<Int> = try! tree.remove(testNode.value!)!
        print("Updated values: \(tree.values())")
        XCTAssertEqual(removedNode.value, testNode.value)
    }
    
    func testRemoveInvalidValue() {
        print("Valid values: \(tree.values())")
        let invalidValue: Int = 15
        print("Invalid value: \(invalidValue)")
        XCTAssertThrowsError(try tree.remove(invalidValue))
        print("Updated values: \(tree.values())")
    }
    
    func testEmptyRootInsert() {
        let emptyTree: BinarySearchTree<Int> = BinarySearchTree<Int>()
        print("Current values: \(emptyTree.values())")
        let testValue: Int = 25
        XCTAssertThrowsError(try emptyTree.put(testValue))
        print("Updated values: \(emptyTree.values())")
    }
    
    func testSetRootAndInsert() {
        let anotherTree: BinarySearchTree<Int> = BinarySearchTree<Int>()
        print("Current values: \(anotherTree.values())")
        anotherTree.root = BinarySearchTree<Int>.Node<Int>(value: 10)
        print("Updated values: \(anotherTree.values())")
        XCTAssertNoThrow(try anotherTree.put(0))
        print("Updated values: \(anotherTree.values())")
    }
    
    func testResetRoot() {
        print("Current values: \(tree.values())")
        let oldRoot: BinarySearchTree<Int>.Node<Int> = tree.root!
        print("Old root: \(oldRoot.value!)")
        var oldValues: [Int] = tree.values()
        let newRoot: BinarySearchTree<Int>.Node<Int> = BinarySearchTree<Int>.Node<Int>(value: 15)
        print("New root: \(newRoot.value!)")
        tree.root = newRoot
        //Add new root value for testing
        oldValues.append(newRoot.value!)
        oldValues.sort()
        print("Updated values: \(tree.values())")
        //Make sure we retained old values
        XCTAssertEqual(oldValues, tree.values().sorted())
        XCTAssertNotEqual(oldRoot, tree.root)
        XCTAssertTrue(tree.root?.value == newRoot.value)
    }
    
    func testMax() {
        let actualMax: Int = tree.values().max()!
        print("Actual Max: \(actualMax)")
        let testMax: Int = (tree.max()?.value!)!
        print("Test Max: \(testMax)")
        XCTAssertEqual(actualMax, testMax)
    }
    
    func testMin() {
        let actualMin: Int = tree.values().min()!
        print("Actual Min: \(actualMin)")
        let testMin: Int = (tree.min()?.value ?? nil)!
        print("Test Min: \(testMin)")
        XCTAssertEqual(actualMin, testMin)
    }
    
    func testMaxWithNilRoot() {
        tree = BinarySearchTree<Int>()
        let max: Int? = tree.max()?.value ?? nil
        XCTAssertNil(max)
    }
    
    func testMinWithNilRoot() {
         tree = BinarySearchTree<Int>()
         let min: Int? = tree.min()?.value ?? nil
         XCTAssertNil(min)
    }
    
    func testHeight() {
        try! tree.put(7)
        try! tree.put(8)
        XCTAssertEqual(tree.height(), 6)
    }
    
    func testDepth() {
        XCTAssertEqual(tree.depth((tree.root?.value)!), 0)
        XCTAssertEqual(tree.depth(6), 3)
    }
    
    func testNodeHeight() {
        XCTAssertEqual(tree.nodeheight(6), 1)
    }
    
    func testBalance() {
        try! tree.put(11)
        tree.balance()
        let leftHeight: Int = tree.nodeheight((tree.root?.left?.value)!)
        let rightHeight: Int = tree.nodeheight((tree.root?.right?.value)!)
        XCTAssertTrue(abs(leftHeight - rightHeight) <= 1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }
    
    // MARK: Test with custom structs
    
    private class TNode: Comparable {
        
        static func < (lhs: BinarySearchTreeTestCase.TNode, rhs: BinarySearchTreeTestCase.TNode) -> Bool {
            return lhs.string < rhs.string
        }
        
        static func == (lhs: BinarySearchTreeTestCase.TNode, rhs: BinarySearchTreeTestCase.TNode) -> Bool {
            return lhs.string == rhs.string
        }
        
        var string: String
        var index: Int // another random field
        
        init(s: String, i: Int) {
            string = s
            index = i
        }
    }
    
    func testSearchTNode() {
        let root = TNode.init(s: "", i: 0)
        let tree = BinarySearchTree<TNode>.init(rootNodeValue: root)
        
        let n1 = TNode.init(s: "hello", i: 1)
        let n2 = TNode.init(s: "my", i: 1)
        let n3 = TNode.init(s: "name", i: 1)
        let n4 = TNode.init(s: "is", i: 1)
        let n5 = TNode.init(s: "neuro", i: 1)
        
        try! tree.put(n1)
        try! tree.put(n2)
        try! tree.put(n3)
        try! tree.put(n4)
        try! tree.put(n5)
        
        var val = tree.get(n1)?.value
        XCTAssertNotNil(val)
        XCTAssertTrue(val == n1)
        
        var n = TNode.init(s: "hello", i: -10)
        val = tree.get(n)?.value
        XCTAssertNotNil(val)
        XCTAssertTrue(val == n1)
        
        n = TNode.init(s: "swift", i: -20)
        val = tree.get(n)?.value
        XCTAssertNil(val)
    }
    
}
