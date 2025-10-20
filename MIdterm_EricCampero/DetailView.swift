//
//  DetailView.swift
//  Midterm_EricCampero
//
//  Created by Eric Campero on 10/19/25.
//


import SwiftUI

struct DetailView: View {
    let cat: Subject
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(cat.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(.gray.opacity(0.2), lineWidth: 4)
                    )
                    .padding(.horizontal)
                
                VStack(alignment: . leading, spacing: 8) {
                    Text(cat.name)
                        .font(.title3).bold()
                    
                    Text(cat.description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

