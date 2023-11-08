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
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                imageSection
                    .frame(width: 240, height: 240)
                    .cornerRadius(16)
                
                Text(character.name)
                    .font(.system(size: 32, weight: .bold))
                    .padding(.bottom, 8)
            }
            
            detailsSection
                .padding(.bottom)
        }
        .padding(.all, 16)
    }
    
    private var imageSection: some View {
        AsyncImage(url: URL(string: character.image)) { image in
            image.resizable()
        } placeholder: {
            Image(character.image)
                .resizable()
                .scaledToFit()
        }
    }
    
    private var detailsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            DetailRow(title: "Status", value: character.status)
            DetailRow(title: "Species", value: character.species)
            DetailRow(title: "Gender", value: character.gender)
            DetailRow(title: "Origin", value: character.origin.name)
            DetailRow(title: "Location", value: character.location.name)
        }
    }
    
    private func DetailRow(title: String, value: String) -> some View {
        HStack {
            Text("\(title):")
                .font(.system(size: 16, weight: .bold))
            Text(value)
                .font(.system(size: 16, weight: .regular))
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}

#Preview {
    CharactersListView()
}
