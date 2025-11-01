import SwiftUI

public struct FixedMenu<Label: View, Content: View>: View {
    @ViewBuilder let content: () -> Content
    @ViewBuilder let label: () -> Label
    let primaryAction: (() -> Void)?
    
    public init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.content = content
        self.label = label
        self.primaryAction = nil
    }
    
    public init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder label: @escaping () -> Label,
        primaryAction: @escaping () -> Void
    ) {
        self.content = content
        self.label = label
        self.primaryAction = primaryAction
    }
    
    public var body: some View {
        if #available(iOS 26, *) {
            newBody
        } else {
            oldBody
        }
    }
    
    @ViewBuilder
    private var newBody: some View {
        ZStack {
            label()
            if let primaryAction {
                Menu(
                    content: content,
                    label: { Color.clear },
                    primaryAction: primaryAction)
            } else {
                Menu(
                    content: content,
                    label: { Color.clear}
                )
            }
        }
    }
    
    @ViewBuilder
    private var oldBody: some View {
        if let primaryAction {
            Menu(
                content: content,
                label: label,
                primaryAction: primaryAction
            )
        } else {
            Menu(
                content: content,
                label: label
            )
        }
    }
}
