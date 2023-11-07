//
//  CharacterView.swift
//  apiswift
//
//  Created by Foundation15 on 07/11/23.
//

import Foundation
import SwiftUI

struct CharacterDetailsView: View{
    let character: CharacterName
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                Spacer()
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 240, height: 240)
                .cornerRadius(16)
                
                Text(character.name)
                    .font(.system(size: 32, weight: .bold))
                Spacer()
                HStack {
                    Spacer()
                    Text(character.status)
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(character.species)
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(character.gender)
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(character.origin.name)
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(character.location.name)
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    CharactersListView()
}
