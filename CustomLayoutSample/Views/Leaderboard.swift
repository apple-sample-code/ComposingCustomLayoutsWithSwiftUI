/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that shows a grid of information about the contenders.
*/

import SwiftUI

/// A view that shows a grid of information about the contenders.
/// - Tag: Leaderboard
struct Leaderboard: View {
    @EnvironmentObject private var model: Model

    var body: some View {
        Grid(alignment: .leading) {
            ForEach(model.pets) { pet in
                GridRow {
                    Text(pet.type)
                    ProgressView(
                        value: Double(pet.votes),
                        total: Double(max(1, model.totalVotes))) // Avoid dividing by zero.
                    Text("\(pet.votes)")
                        .gridColumnAlignment(.trailing)
                }

                Divider()
            }
        }
        .padding()
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
            .environmentObject(Model.previewData)
    }
}
