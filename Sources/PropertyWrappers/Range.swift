//
// Range.swift
//

import Foundation

@propertyWrapper
public struct Range<T: Comparable> {
    
    // MARK: - Private let
    
    private let range: ClosedRange<T>
    
    private let isCycled: Bool
    
    // MARK: - Public var
    
    public var wrappedValue: T {
        get {
            return isCycled ? (value < range.upperBound ? value : range.lowerBound) : value
        }
        set {
            let min = range.lowerBound
            let max = range.upperBound
            value = newValue < min ? min : (newValue > max ? max : newValue)
        }
    }
    
    // MARK: - Private var
    
    private var value: T
    
    // MARK: - Public init
    
    public init(_ range: ClosedRange<T>, _ isCycled: Bool = false) {
        self.range = range
        self.isCycled = isCycled
        self.value = range.lowerBound
    }
}
