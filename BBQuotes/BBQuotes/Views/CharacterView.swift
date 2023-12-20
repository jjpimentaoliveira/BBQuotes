//
//  CharacterView.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image(.breakingbad)
                    .resizable()
                    .scaledToFit()

                ScrollView {
                    VStack {
                        Image(.jessepinkman)
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 1.7)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 60)

                    VStack(alignment: .leading) {
                        Text("Jesse Pinkman")
                            .font(.largeTitle)
                            .fontWeight(.semibold)

                        Text("Portrayed By: Aaron Paul")
                            .font(.subheadline)

                        Divider()

                        Text("Jesse Pinkman Character Info")
                            .font(.title2)

                        Text("Born: 09-24-1984")

                        Divider()

                        Text("Occupations:")
                            .font(.title2)

                        ForEach(0..<3) { index in
                            Text("• Occupation \(index)")
                                .font(.subheadline)
                        }

                        Divider()

                        Text("Nicknames:")
                            .font(.title2)

                        ForEach(0..<3) { index in
                            Text("• Nickname \(index)")
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
    CharacterView()
}
