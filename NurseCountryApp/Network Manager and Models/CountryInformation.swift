//
//  CountryInformation.swift
//  NurseCountryApp
//
//  Created by Nurse Ntombi Masango on 2022/12/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countryInfo = try? newJSONDecoder().decode(CountryInfo.self, from: jsonData)

import Foundation

// MARK: - CountryInfoElement
struct CountryInfoElement: Codable {
    let flags: Flags?
    let name: Name?
    let currencies: [String: Currency]?
    let capital, altSpellings: [String]?
    let region: Region?
    let languages: [String: String]?
    let flag: String?
}

// MARK: - Currency
struct Currency: Codable {
    let name, symbol: String?
}

// MARK: - Flags
struct Flags: Codable {
    let png: String?
    let svg: String?
}

// MARK: - Name
struct Name: Codable {
    let common, official: String?
    let nativeName: [String: NativeName]?
}

// MARK: - NativeName
struct NativeName: Codable {
    let official, common: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

typealias CountryInfo = [CountryInfoElement]
