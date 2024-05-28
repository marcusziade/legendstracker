import Kingfisher
import SwiftUI

struct MapRotationView: View {

    @StateObject var model: MapRotationVM
    
    init(model: MapRotationVM) {
        self._model = StateObject(wrappedValue: model)
    }

    var body: some View {
        switch model.state {

        case .loading:
            ProgressView()

        case .error(let errorMessage):
            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")

        case .result(let result):
            TabView {
                ZStack {
                    GeometryReader { p in
                        KFImage(URL(string: result.map.current.asset))
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    }
                    
                    VStack(spacing: 0) {
                        Spacer()
                        MapInfoView(isCurrent: true, rotation: result.map)
                        Spacer()
                        RoundedRectangle(cornerRadius: 0)
                            .frame(height: 2)
                        Spacer()
                        MapInfoView(isCurrent: false, rotation: result.map)
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .shadow(radius: 5)
                    .shadow(radius: 5)
                }
                .ignoresSafeArea()
                
                List(result.craftingComponents, id: \.self) { component in
                    Section(component.bundleType) {
                        CraftingRow(model: component)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .ignoresSafeArea(edges: .top)
            
        case .empty:
            EmptyView()
        }
    }
}

struct MapRotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapRotationView(model: MapRotationVM.mock)
            .preferredColorScheme(.dark)
    }
}
