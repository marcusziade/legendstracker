import Kingfisher
import SwiftUI

struct OwnedLegendsView: View {

    let player: ApexPlayer

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                Group {
                    if player.allLegends.revenant != nil {
                        KFImage(URL(string: (player.allLegends.revenant?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.crypto != nil {
                        KFImage(URL(string: (player.allLegends.crypto?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.horizon != nil {
                        KFImage(URL(string: (player.allLegends.horizon?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.gibraltar != nil {
                        KFImage(URL(string: (player.allLegends.gibraltar?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.wattson != nil {
                        KFImage(URL(string: (player.allLegends.wattson?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.fuse != nil {
                        KFImage(URL(string: (player.allLegends.fuse?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.bangalore != nil {
                        KFImage(URL(string: (player.allLegends.bangalore?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.wraith != nil {
                        KFImage(URL(string: (player.allLegends.wraith?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.octane != nil {
                        KFImage(URL(string: (player.allLegends.octane?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.bloodhound != nil {
                        KFImage(URL(string: (player.allLegends.bloodhound?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                }
                Group {
                    if player.allLegends.caustic != nil {
                        KFImage(URL(string: (player.allLegends.caustic?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.lifeline != nil {
                        KFImage(URL(string: (player.allLegends.lifeline?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.pathfinder != nil {
                        KFImage(URL(string: (player.allLegends.pathfinder?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.loba != nil {
                        KFImage(URL(string: (player.allLegends.loba?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.mirage != nil {
                        KFImage(URL(string: (player.allLegends.mirage?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.rampart != nil {
                        KFImage(URL(string: (player.allLegends.rampart?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                }
                Group {
                    if player.allLegends.valkyrie != nil {
                        KFImage(URL(string: (player.allLegends.valkyrie?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.seer != nil {
                        KFImage(URL(string: (player.allLegends.seer?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.ash != nil {
                        KFImage(URL(string: (player.allLegends.ash?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.madMaggie != nil {
                        KFImage(URL(string: (player.allLegends.madMaggie?.imgAssets.icon) ?? ""))
                            .placeholder { Image(systemName: "person.crop.square.fill").resizable().padding() }
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.newcastle != nil {
                        KFImage(URL(string: (player.allLegends.newcastle?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                    if player.allLegends.vantage != nil {
                        KFImage(URL(string: (player.allLegends.vantage?.imgAssets.icon) ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(height: height)
                    }
                }
            }
        }
    }

    private let height: CGFloat = 100
}

struct OwnedLegendsView_Previews: PreviewProvider {
    static var previews: some View {
        OwnedLegendsView(player: ApexService().playerMock)
            .preferredColorScheme(.dark)
    }
}
