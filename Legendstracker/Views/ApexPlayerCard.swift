import SwiftUI

struct ApexPlayerCard: View {
    let player: ApexPlayer
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                if let url = player.avatarURL {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(player.name)
                        .font(.headline)
                    Text("Platform: \(player.platform)")
                        .font(.subheadline)
                }
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Level: \(player.level)")
                    Text("Progress to Next Level: \(player.toNextLevelPrecent)%")
                }
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(player.rankedBrSeasonTitle)
                    if let url = player.rankedBrRankImageURL {
                        AsyncImage(url: url) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }.frame(width: 50, height: 50)
                    }
                }
                Spacer()
                VStack(alignment: .leading, spacing: 4) {
                    Text(player.rankedArenaSeasonTitle)
                    if let url = player.rankedArenaRankImageURL {
                        AsyncImage(url: url) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }.frame(width: 50, height: 50)
                    }
                }
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
