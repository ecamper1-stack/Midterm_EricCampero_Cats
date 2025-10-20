//
/*:
 
    #Midterm Project

    #Eric_Campero

    #10/19/2025.
*/
//

import SwiftUI

struct ContentView: View {
    private let cats: [Subject] = Bundle.main.decode([Subject].self, from: "Data.json")
    
    private let columns = [GridItem(.flexible(), spacing: 12)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(cats) { cat in
                        NavigationLink(value: cat) {
                        CatRow(cat: cat)
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                }
            }
            .padding(.top, 8)
        }
        .navigationTitle("Top 10 Cats") // Title
        .navigationDestination(for: Subject.self) { cat in
            DetailView(cat: cat)
        }
      }
   }
}

private struct CatRow: View {
    let cat: Subject
    
    var body: some View {
        HStack(spacing: 12) {
            Image(cat.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 72, height: 72)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.gray.opacity(0.2), lineWidth: 1)
                    
                )
            
            Text(cat.name)
                .font(.headline)
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    ContentView()
}
