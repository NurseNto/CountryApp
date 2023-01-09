//
//  ServiceCall.swift
//  NurseCountryApp
//
//  Created by Nurse Ntombi Masango on 2022/12/19.
//

import Foundation

class ServiceCall {
    private let getAllUrl  = "https://restcountries.com/v3.1/all?fields=name,capital,currencies,languages,region,flag,flags"
    private let searchUrl = "https://restcountries.com/v3.1/name/"

     var riddles: CountryInfo?
      static let shared = ServiceCall()
    func getCountries(completion: @escaping (CountryInfo?) -> Void) {
          guard let url = URL(string: getAllUrl) else {
              completion(nil)
              return
          }

          let request = URLRequest(url: url)
          let task = URLSession.shared.dataTask(with: request) { data, _, _ in
              guard let data = data else {
                  return
              }

              do {
                  let countryResponse = try JSONDecoder().decode(CountryInfo.self, from: data)
                  completion(countryResponse)
              } catch _ {
                  completion(nil)
              }
          }
          task.resume()
      }
    
    func getNames(name: String, completion: @escaping (CountryInfo?) -> Void) {
        guard let url = URL(string: searchUrl + name) else {
            completion(nil)
            return
        }

        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                return
            }

            do {
                let nameResponse = try JSONDecoder().decode(CountryInfo.self, from: data)
                completion(nameResponse)
            } catch _ {
                completion(nil)
            }
        }
        task.resume()
    }
}
