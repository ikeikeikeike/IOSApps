//
// https://github.com/docbohanh/CodableDemo/blob/master/CodableDemo/CodableDemo/CSVDecoder.swift
//
import Foundation

open class CSVDecoder {
    public init() {}

    open func decode<T: Decodable>(_ type: T.Type, from csv: String) throws -> [T] {
        var rows = csv.components(separatedBy: .newlines)
        let titleRow = rows.removeFirst()

        return try rows.map {
            let decoder = _CSVRowDecoder(titleRow: titleRow, valueRow: $0)
            return try T(from: decoder)
        }

    }
}

private class _CSVRowDecoder: Decoder {
    let titles: [String]
    let values: [String]

    var codingPath: [CodingKey] { return [] }

    /// Contextual user-provided information for use during encoding.
    var userInfo: [CodingUserInfoKey : Any] { return [:] }

    // MARK: - Initialization

    /// Initializes `self` with the given top-level container and options.
    init(titleRow: String, valueRow: String) {
        titles = titleRow.split(separator: ",").map { String($0) }
        values = valueRow.split(separator: ",").map { String($0) }
    }

    // MARK: - Coding Path Operations

    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> {
        let container = _CSVKeyedDecodingContainer<Key>(referencing: self)
        return KeyedDecodingContainer(container)
    }

    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        let desc = "Cannot get unkeyed decoding container -- found null value instead."
        throw DecodingError.valueNotFound(
            UnkeyedDecodingContainer.self,
            DecodingError.Context(codingPath: self.codingPath,
                                  debugDescription: desc))
    }

    func singleValueContainer() throws -> SingleValueDecodingContainer {
        let desc = "Cannot get single value decoding container -- found keyed container instead."
        throw DecodingError.typeMismatch(
            SingleValueDecodingContainer.self,
            DecodingError.Context(codingPath: self.codingPath,
                                  debugDescription: desc))
    }
}

// MARK: Decoding Containers
private struct _CSVKeyedDecodingContainer<K : CodingKey> : KeyedDecodingContainerProtocol {

    typealias Key = K

    // MARK: Properties

    /// A reference to the decoder we're reading from.
    let decoder: _CSVRowDecoder

    /// Data we're reading from.
    let columns: [String : String]

    /// The path of coding keys taken to get to this point in decoding.
    var codingPath: [CodingKey]

    // MARK: - Initialization

    /// Initializes `self` by referencing the given decoder.
    init(referencing decoder: _CSVRowDecoder) {
        self.decoder = decoder
        self.codingPath = decoder.codingPath
        columns = Dictionary(uniqueKeysWithValues: zip(decoder.titles, decoder.values))
    }

    // MARK: - KeyedDecodingContainerProtocol Methods

    var allKeys: [Key] {
        return columns.keys.flatMap { Key(stringValue: $0) }
    }

    func contains(_ key: K) -> Bool {
        return columns[key.stringValue] != nil
    }

    func decodeNil(forKey key: K) throws -> Bool {
        return columns[key.stringValue] != nil
    }

    func decode(_ type: Bool.Type, forKey key: K) throws -> Bool {
        return columns[key.stringValue].flatMap { Bool($0) } ?? false
    }

    func decode(_ type: Int.Type, forKey key: K) throws -> Int {
        return columns[key.stringValue].flatMap { Int($0) } ?? 0
    }

    func decode(_ type: Int8.Type, forKey key: K) throws -> Int8 {
        return columns[key.stringValue].flatMap { Int8($0) } ?? 0
    }

    func decode(_ type: Int16.Type, forKey key: K) throws -> Int16 {
        return columns[key.stringValue].flatMap { Int16($0) } ?? 0
    }

    func decode(_ type: Int32.Type, forKey key: K) throws -> Int32 {
        return columns[key.stringValue].flatMap { Int32($0) } ?? 0
    }

    func decode(_ type: Int64.Type, forKey key: K) throws -> Int64 {
        return columns[key.stringValue].flatMap { Int64($0) } ?? 0
    }

    func decode(_ type: UInt.Type, forKey key: K) throws -> UInt {
        return columns[key.stringValue].flatMap { UInt($0) } ?? 0
    }

    func decode(_ type: UInt8.Type, forKey key: K) throws -> UInt8 {
        return columns[key.stringValue].flatMap { UInt8($0) } ?? 0
    }

    func decode(_ type: UInt16.Type, forKey key: K) throws -> UInt16 {
        return columns[key.stringValue].flatMap { UInt16($0) } ?? 0
    }

    func decode(_ type: UInt32.Type, forKey key: K) throws -> UInt32 {
        return columns[key.stringValue].flatMap { UInt32($0) } ?? 0
    }

    func decode(_ type: UInt64.Type, forKey key: K) throws -> UInt64 {
        return columns[key.stringValue].flatMap { UInt64($0) } ?? 0
    }

    func decode(_ type: Float.Type, forKey key: K) throws -> Float {
        return columns[key.stringValue].flatMap { Float($0) } ?? 0
    }

    func decode(_ type: Double.Type, forKey key: K) throws -> Double {
        return columns[key.stringValue].flatMap { Double($0) } ?? 0
    }

    func decode(_ type: String.Type, forKey key: K) throws -> String {
        return columns[key.stringValue] ?? ""
    }

    func decode(_ type: Data.Type, forKey key: K) throws -> Data {
        return columns[key.stringValue]?.data(using: .utf8) ?? Data()
    }

    func decode<T : Decodable>(_ type: T.Type, forKey key: K) throws -> T {
        throw DecodingError.dataCorrupted(
            DecodingError.Context(codingPath: codingPath,
                                  debugDescription: "none")
        )
    }

    func nestedContainer<NestedKey>
        (keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> {

        throw DecodingError.dataCorrupted(
            DecodingError.Context(codingPath: codingPath,
                                  debugDescription: "none")
        )
    }

    func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        throw DecodingError.dataCorrupted(
            DecodingError.Context(codingPath: codingPath,
                                  debugDescription: "none")
        )
    }

    func superDecoder() throws -> Decoder {
        throw DecodingError.dataCorrupted(
            DecodingError.Context(codingPath: codingPath,
                                  debugDescription: "none")
        )
    }

    func superDecoder(forKey key: K) throws -> Decoder {
        throw DecodingError.dataCorrupted(
            DecodingError.Context(codingPath: codingPath,
                                  debugDescription: "none")
        )
    }
}
