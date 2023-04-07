import Kingfisher
import SwiftUI

struct PlayerGlobalInfoView: View {
    let player: ApexPlayer
    
    var body: some View {
        Form {
            generalSection
            liveStatusSection
            selectedLegendSection
            ranksSection
            
            if player.bans.isActive {
                Section("Bans") {
                    Text("Status: \(player.bans.isActive ? "Banned" : "Not banned")")
                    Text("\(player.unBanDateText) remaining")
                    Text(player.bans.lastBanReason)
                }
            }
        }
        .fontWeight(.black)
    }
    
    private var generalSection: some View {
        Section("General") {
            Text(player.name)
            if let avatarURL = player.avatarURL {
                KFImage(avatarURL)
            }
            Text(player.platform)
            HStack {
                KFImage(URL(string: player.brRank.rankImg))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
                KFImage(URL(string: player.arenaRank.rankImg))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            }
            Text("Level: \(player.level)")
            Text("Next level: \(player.toNextLevelPrecent)%")
            Text("User ID: \(player.UID)")
        }
        .listRowBackground(Color.clear)
        .fontWeight(.black)
    }
    
    private var liveStatusSection: some View {
        Section("Live status") {
            Label(player.isOnline ? "Online" : "Offline", systemImage: "bolt.horizontal.circle.fill")
                .foregroundColor(player.isOnline ? .green : .red)
            
            if player.isOnline {
                Label(
                    player.isInGame ? "In-game" : "Idle",
                    systemImage: player.isInGame ? "gamecontroller.fill" : "person.circle.fill"
                )
                .foregroundColor(player.isInGame ? .green : .blue)
                Label(player.lobbyState.capitalized, systemImage: player.isOnline ? "shareplay" : "shareplay.slash")
                    .foregroundColor(.blue)
                Label(
                    player.isJoinable ? "Joinable" : "Private",
                    systemImage: player.isJoinable ? "person.fill.checkmark" : "person.fill.xmark"
                )
                .foregroundColor(.blue)
                Label(
                    player.isPartyFull ? "Full party" : "Free slot in party",
                    systemImage: player.isPartyFull ? "person.3.fill" : "person.3"
                )
                .foregroundColor(player.isPartyFull ? .gray : .green)
                Label(player.selectedLegendName, systemImage: "gamecontroller.fill")
                HStack(alignment: .lastTextBaseline) {
                    Text(player.currentState.capitalized)
                    if player.currentStateSinceTimestamp != -1 {
                        Text(player.currentStateSinceTimestampText)
                            .font(.caption)
                    }
                }
            }
        }
    }
    
    private var selectedLegendSection: some View {
        Section("Selected Legend") {
            HStack {
                if let iconURL = player.selectedLegend?.imgAssets.icon {
                    KFImage(URL(string: iconURL))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                }
                Text(player.selectedLegend?.legendName ?? "–")
                    .font(.title)
                    .fontWeight(.black)
                    .offset(y: 10)
            }
            if let bannerURL = player.selectedLegend?.imgAssets.banner {
                KFImage(URL(string: bannerURL))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(4)
            } else {
                Text("No legend selected")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private var ranksSection: some View {
        Group {
            if let rankedBrRankImageURL = player.rankedBrRankImageURL {
                Section("BR Ranked") {
                    RankSectionView(
                        score: player.brRank.rankScore,
                        rankName: player.brRank.rankName,
                        rankDivision: player.brRank.rankDiv,
                        seasonTitle: player.rankedBrSeasonTitle,
                        thumbnail: rankedBrRankImageURL
                    )
                }
            }
            
            if let rankedArenaRankImageURL = player.rankedArenaRankImageURL {
                Section("Arena Ranked") {
                    RankSectionView(
                        score: player.arenaRank.rankScore,
                        rankName: player.arenaRank.rankName,
                        rankDivision: player.arenaRank.rankDiv,
                        seasonTitle: player.rankedArenaSeasonTitle,
                        thumbnail: rankedArenaRankImageURL
                    )
                }
            }
        }
    }
}
