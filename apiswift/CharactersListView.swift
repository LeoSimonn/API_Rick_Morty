import SwiftUI

struct CharactersListView: View {
    @ObservedObject var viewModel = CharactersViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                NavigationLink(destination: CharacterDetailsView(character: character)) {
                    CharacterDetailsView(character: character)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Rick and Morty Characters")
            .onAppear {
                // Esta é a chamada para carregar os personagens quando a view aparece
                Task {
                    await viewModel.fetchCharacters()
                }
            }
        }
    }
}

#Preview{
    CharactersListView()
}
