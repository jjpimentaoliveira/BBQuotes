//
//  CharacterView.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import SwiftUI

struct CharacterView: View {

    let show: String
    let character: Character

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image(show.lowerNoSpaces)
                    .resizable()
                    .scaledToFit()

                ScrollView {
                    VStack {
                        AsyncImage(url: character.images.randomElement()) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 1.7)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 60)

                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.largeTitle)
                            .fontWeight(.semibold)

                        Text("Portrayed By: \(character.portrayedBy)")
                            .font(.subheadline)

                        Divider()

                        Text("\(character.name) Character Info")
                            .font(.title2)

                        Text("Born: \(character.birthday)")

                        Divider()

                        Text("Occupations:")
                            .font(.title2)

                        ForEach(character.occupations, id: \.self) { occupation in
                            Text("• \(occupation)")
                                .font(.subheadline)
                        }

                        Divider()

                        Text("Nicknames:")
                            .font(.title2)

                        if character.aliases.count > 0 {
                            ForEach(character.aliases, id: \.self) { nickname in
                                Text("• \(nickname)")
                                    .font(.subheadline)
                            }
                        } else {
                            Text("None")
                                .font(.subheadline)
                        }
                    }
                    .padding([.leading, .bottom], 30)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView(show: Constants.bbName, character: Constants.previewCharacter)
}
