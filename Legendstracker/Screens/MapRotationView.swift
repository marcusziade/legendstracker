import Kingfisher
import SwiftUI

struct MapRotationView: View {

    @ObservedObject var model: MapRotationVM

    var body: some View {
        switch model.state {

        case .loading:
            ProgressView()

        case .error(message: let errorMessage):
            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")

        case .result(rotation: let r):
            ZStack {
                GeometryReader { p in
                    KFImage(URL(string: r.current.asset))
                        .placeholder {
                            ProgressView("Loading...")
                        }
                        .resizable()
                        .scaledToFill()
                        // There's a small black bar at the bottom of the iPhone 8. +10 fixes it.
                        .frame(height: p.size.height + 10)
                        .ignoresSafeArea()
                }

                VStack(spacing: 0) {
                    Spacer()
                    MapInfoView(isCurrent: true, rotation: r)
                    Spacer()
                    RoundedRectangle(cornerRadius: 0)
                        .frame(height: 2)
                    Spacer()
                    MapInfoView(isCurrent: false, rotation: r)
                    Spacer()
                }
                .foregroundColor(.white)
                .shadow(radius: 5)
                .shadow(radius: 5)
                .shadow(radius: 5)
            }
            .ignoresSafeArea()
        }
    }
}

struct MapRotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapRotationView(model: MapRotationVM.mock)
            .preferredColorScheme(.dark)
    }
}
