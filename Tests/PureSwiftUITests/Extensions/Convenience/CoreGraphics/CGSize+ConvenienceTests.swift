//
//  CGSize+Tests.swift
//  
//
//  Created by Adam Fordyce on 25/11/2019.
//

import XCTest
@testable import PureSwiftUI

class CGSizeConvenienceExtensionsTests: XCTestCase {

    let width: CGFloat = 4
    let height: CGFloat = 6

    let max: CGFloat = 10
    let min: CGFloat = 2

    var halfWidth: CGFloat {
        width * 0.5
    }
    
    var halfHeight: CGFloat {
        height * 0.5
    }
    
    var size: CGSize {
        CGSize(width: width, height: height)
    }
}

// MARK: ----- INIT

extension CGSizeConvenienceExtensionsTests {
    
    func testInit() {
        XCTAssertEqual(CGSize(width, height), size)
        XCTAssertEqual(CGSize(width.asInt, height.asInt), size)
        XCTAssertEqual(CGSize(width), CGSize(width, width))
    }
}

// MARK: ----- TYPE COERCION

extension CGSizeConvenienceExtensionsTests {

    func testAsType() {
        XCTAssertEqual(size.asCGRect, CGRect(0, 0, width, height))
        XCTAssertEqual(size.asCGPoint, CGPoint(width, height))
        XCTAssertEqual(size.asCGVector, CGVector(width, height))
    }
}

// MARK: ----- DIMENSIONS

extension CGSizeConvenienceExtensionsTests {
    
    func testDimensions() {
        XCTAssertEqual(size.x, width)
        XCTAssertEqual(size.y, height)
        XCTAssertEqual(size.midX, halfWidth)
        XCTAssertEqual(size.midY, halfHeight)
        XCTAssertEqual(size.halfWidth, halfWidth)
        XCTAssertEqual(size.halfHeight, halfHeight)
    }
}

// MARK: ----- SCALED

extension CGSizeConvenienceExtensionsTests {

    func testScaled() {
        XCTAssertEqual(size.scaled(0.5), CGSize(halfWidth, halfHeight))
        XCTAssertEqual(size.widthScaled(0.5), halfWidth)
        XCTAssertEqual(size.heightScaled(0.5), halfHeight)
    }
}

// MARK: ----- CLAMPING

extension CGSizeConvenienceExtensionsTests {
    
    func testClamping() {
        XCTAssertEqual(size.clamped(from: 4.1, to: 5.9), CGSize(4.1, 5.9))
        XCTAssertEqual(size.clamped(from: 4.1, to: 8), CGSize(4.1, height))
        XCTAssertEqual(size.clamped(from: 2, to: 5.9), CGSize(width, 5.9))
        XCTAssertEqual(size.clamped(from: 2, to: 10), size)
    }
}

// MARK: ----- OPERATORS

extension CGSizeConvenienceExtensionsTests {
    
    func testMinus() {
        XCTAssertEqual(size - .square(1), CGSize(width - 1, height - 1))
        XCTAssertEqual(size - size, .zero)
    }
    
    func testPlus() {
        XCTAssertEqual(size + size, CGSize(width + width, height + height))
        XCTAssertEqual(size + .square(1), CGSize(width + 1, height + 1))
    }
}

// MARK: ----- STATIC CONSTRUCTORS

extension CGSizeConvenienceExtensionsTests {
    
    func testSquare() {
        XCTAssertEqual(CGSize.square(width), CGSize(width))
        XCTAssertEqual(CGSize.square(width.asInt), CGSize(width))
    }
}
