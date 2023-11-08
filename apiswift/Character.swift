//
//  Character.swift
//  apiswift
//
//  Created by Foundation15 on 07/11/23.
//

import Foundation
import SwiftUI

struct CharacterName: Decodable, Identifiable{
    let id : Int
    let name : String
    let image: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Location

}

struct Origin: Decodable {
    let name: String
    let url: String
}

struct Location: Decodable {
    let name: String
    let url: String
}

struct CharacterInfo: Decodable{
    let count : Int
    let pages : Int
    let next : String?
    let prev : String?
}


struct CharacterResponse: Decodable{
    
    let info: CharacterInfo
    let results: [CharacterName]
    
}

class CharactersViewModel: ObservableObject {
    @Published var characters: [CharacterName] = []
    
    func fetchCharacters() async {
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let CharacterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
            characters = CharacterResponse.results
        } catch {
            print("Erro ao buscar personagens: \(error)")
        }
    }
}

#Preview {
    CharactersListView()
}
