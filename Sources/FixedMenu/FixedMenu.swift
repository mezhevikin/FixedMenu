import SwiftUI

public struct FixedMenu<Label: View, Content: View>: View {
    let content: () -> Content
    let label: () -> Label
    let primaryAction: (() -> Void)?
    
    public init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder label: @escaping () -> Label,
        primaryAction: (() -> Void)? = nil
    ) {
        self.content = content
        self.label = label
        self.primaryAction = primaryAction
    }
    
    public var body: some View {
        if #available(iOS 26, *) {
            GlassEffectContainer {
                menu {
                    label().glassEffect(.identity)
                }
                .clipped()
            }
        } else {
            menu(label: label)
        }
    }
    
    @ViewBuilder
    private func menu<L: View>(@ViewBuilder label: @escaping () -> L) -> some View {
        if let primaryAction {
            Menu(content: content, label: label, primaryAction: primaryAction)
        } else {
            Menu(content: content, label: label)
        }
    }
}
