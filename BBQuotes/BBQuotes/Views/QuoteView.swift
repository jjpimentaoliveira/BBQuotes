//
//  QuoteView.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.breakingbad)
                    .resizable()
                    .frame(width: geometry.size.width * 2.7, height: geometry.size.height)

                VStack {
                    Text("\"You either run from things, or you face them, Mr. White\"")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding()

                    ZStack(alignment: .bottom) {
                        Image(.jessepinkman)
                            .resizable()
                            .scaledToFill()

                        Text("Jesse Pinkman")
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .frame(width: geometry.size.width / 1.1, height: geometry.size.height / 1.9)
                }
                .frame(width: geometry.size.width)

            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView()
        .preferredColorScheme(.dark)
}
