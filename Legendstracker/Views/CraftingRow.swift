import Kingfisher
import SwiftUI

struct CraftingRow: View {
    
    let model: CraftingResponseElement
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(convertSnakeCasedString(model.bundle))
                .font(.subheadline)
            ForEach(model.bundleContent, id: \.self) { item in
                HStack {
                    KFImage(item.itemType.asset)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(4)
                    Text(convertSnakeCasedString(item.item))
                        .font(.caption)
                }
            }
        }
    }
    
    private func convertSnakeCasedString(_ input: String) -> String {
        let parts = input.components(separatedBy: "_")
        var output = ""
        for (index, part) in parts.enumerated() {
            if index == 0 {
                output += part.capitalized
            } else {
                output += " " + part.capitalized
            }
        }
        return output
    }
}

struct CraftingRow_Previews: PreviewProvider {
    static var previews: some View {
        CraftingRow(model: ApexService().craftingRotation_Mock.first!)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
