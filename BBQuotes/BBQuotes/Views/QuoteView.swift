//
//  QuoteView.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import SwiftUI

struct QuoteView: View {
    let show: String
    @StateObject var viewModel = ViewModel(controller: FetchController())

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(show.lowercased().filter { $0 != " " })
                    .resizable()
                    .frame(width: geometry.size.width * 2.7, height: geometry.size.height)

                VStack {
                    Spacer(minLength: 50)

                    switch viewModel.status {
                    case .notStarted:
                        EmptyView()

                    case .fetching:
                        ProgressView()

                    case .success(let data):
                        Text("\"\(data.quote.quote)\"")
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                            .background(.black.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .padding()

                        ZStack(alignment: .bottom) {
                            AsyncImage(url: data.character.images[0]) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(
                                width: geometry.size.width / 1.1,
                                height: geometry.size.height / 1.8
                            )

                            Text(data.character.name)
                                .foregroundStyle(.white)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(.ultraThinMaterial)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .frame(
                            width: geometry.size.width / 1.1,
                            height: geometry.size.height / 1.8
                        )

                    case .failed:
                        EmptyView()
                    }

                    Spacer()

                    Button {
                        Task {
                            await viewModel.getData(for: show)
                        }
                    } label: {
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.breakingBadGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .shadow(color: .breakingBadYellow, radius: 2)
                    }

                    Spacer(minLength: 100)
                }
                .frame(width: geometry.size.width)

            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
