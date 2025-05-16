//
//  FetchService.swift
//  BBQuotes
//
//  Created by Vinod Rathod on 12/05/25.
//

import Foundation

struct FetchService {
    private enum fetcherror: Error {
        case badError
    }
    
    private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")
    
    func fetchQuotes(show: String) async throws -> Quote {
        let quoteUrl = baseURL?.appending(path: "quote/random")
        let fetchUrl = quoteUrl!.appending(queryItems: [URLQueryItem(name: "production", value: show)])
        
        let (data, response) = try await URLSession.shared.data(from: fetchUrl)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw fetcherror.badError
        }
    
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        return quote
    }
    
    func fetchCharacters(name: String) async throws -> Char {
        let characterUrl = baseURL?.appending(path: "character")
        let fetchUrl = characterUrl?.appending(queryItems: [URLQueryItem(name: "name", value: name)])
        
        let (data, response) = try await URLSession.shared.data(from: fetchUrl!)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw fetcherror.badError
        }
        
        let character = try JSONDecoder().decode(Char.self, from: data);
        return character
    }
    
    func fetchDeath(for character: String) async throws -> Death? {
        let fetchUrl = baseURL?.appending(path: "deaths")
    
        
        let (data, response) = try await URLSession.shared.data(from: fetchUrl!)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw fetcherror.badError
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deaths = try decoder.decode([Death].self, from: data);
        
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        
        return nil
    }
}
