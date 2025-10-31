//  NexusSidebarEntries.swift
//  tvOS_testcode
//
//  Adds two sidebar entries:
//  - NexusiOSSwiftUI component test
//  - NexusiOSUIKit component test
//
//  Integrate: you can also use these list views directly.

import SwiftUI

public struct NexusSwiftUIComponentListView: View {
    @Binding var selectedOption: String?
    public init(selectedOption: Binding<String?>) {
        self._selectedOption = selectedOption
    }
    public init() {
        self.init(selectedOption: .constant(nil))
    }
    public var body: some View {
        List(NexusSwiftUIComponent.allCases) { item in
            NavigationLink(item.title) {
                NexusSwiftUIDetail(item: item, selectedOption: $selectedOption)
            }
        }
        .font(.title3) // 設定字型大小為 title3
        .navigationTitle("SwiftUI Components (41)")
    }
}

public struct NexusUIKitComponentListView: View {
    @Binding var selectedOption: String?
    public init(selectedOption: Binding<String?>) {
        self._selectedOption = selectedOption
    }
    public init() {
        self.init(selectedOption: .constant(nil))
    }
    public var body: some View {
        List(NexusUIKitComponent.allCases) { item in
            NavigationLink(item.title) {
                NexusUIKitDetail(item: item, selectedOption: $selectedOption)
            }
        }
        .font(.title2) // 設定字型大小為 title2
        .navigationTitle("UIKit Components (38)")
    }
}

// Optional index page if you prefer a hub view
public struct NexusDemosIndex: View {
    public init() {}
    public var body: some View {
        List {
            NavigationLink("NexusiOSSwiftUI component test") { NexusSwiftUIComponentListView() }
            NavigationLink("NexusiOSUIKit component test") { NexusUIKitComponentListView() }
        }
        .navigationTitle("Nexus Demos")
    }
}
