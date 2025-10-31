//  NexusSwiftUIDemos.swift
//  41 SwiftUI components with tvOS-safe demos.

import SwiftUI

// MARK: - Data Models

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let city: String
}

// MARK: - SwiftUI Component Enum (41)

enum NexusSwiftUIComponent: String, CaseIterable, Identifiable {
    // Sorted alphabetically
    case alert = "Alert✅"
    case anyView = "AnyView✅"
    case button = "Button✅"
    case canvas = "Canvas✅"
    case colorPicker = "ColorPicker❌"
    case confirmationDialog = "ConfirmationDialog✅"
    case controlGroup = "ControlGroup✅"
    case disclosureGroup = "DisclosureGroup✅"
    case divider = "Divider✅"
    case geometryReader = "GeometryReader✅"
    case group = "Group✅"
    case hstack = "HStack✅"
    case image = "Image✅"
    case label = "Label✅"
    case lazyHGrid = "LazyHGrid✅"
    case lazyHStack = "LazyHStack✅"
    case lazyVGrid = "LazyVGrid✅"
    case lazyVStack = "LazyVStack✅"
    case link = "Link✅"
    case list = "List✅"
    case menu = "Menu✅"
    case navigationSplitView = "NavigationSplitView✅"
    case navigationStack = "NavigationStack✅"
    case photosPicker = "PhotosPicker❌"
    case popover = "Popover❌"
    case progressView = "ProgressView✅"
    case scrollView = "ScrollView✅"
    case section = "Section✅"
    case secureField = "SecureField✅"
    case sheet = "Sheet✅"
    case slider = "Slider❌"
    case spacer = "Spacer✅"
    case stepper = "Stepper❌"
    case tabView = "TabView✅"
    case table = "Table❌"
    case text = "Text✅"
    case textField = "TextField✅"
    case toggle = "Toggle✅"
    case toolbarItem = "ToolbarItem✅"
    case vstack = "VStack✅"
    case zstack = "ZStack✅"

    var id: String { rawValue }
    var title: String { rawValue }
}

// MARK: - Detail Router

struct NexusSwiftUIDetail: View {
    let item: NexusSwiftUIComponent
    @Binding var selectedOption: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text(item.title).font(.title2)
                Divider()
                demo
                Spacer(minLength: 20)
                Button("Back to Sidebar") {
                    selectedOption = nil
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle(item.title)
    }

    @ViewBuilder
    private var demo: some View {
        switch item {
        case .text: Text("This is Text on tvOS").font(.title3)
        case .image:
            Image(systemName: "sparkles").resizable().scaledToFit().frame(width: 160, height: 160)
        case .button:
            Button("Tap me") { }.buttonStyle(.bordered)
        case .toggle:
            Toggle("Enable Option", isOn: .constant(true)).frame(maxWidth: 800)
        case .label:
            Label("Downloads", systemImage: "arrow.down.circle").labelStyle(.titleAndIcon)
        case .link:
            Link("Open Apple", destination: URL(string: "https://apple.com")!)
        case .divider:
            VStack { Text("Above"); Divider(); Text("Below") }
        case .spacer:
            HStack { Text("Left"); Spacer(); Text("Right") }.frame(maxWidth: .infinity)
        case .group:
            Group { Text("Inside Group") }.padding().overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray))
        case .section:
            List { Section("A") { Text("Row 1"); Text("Row 2") }; Section("B") { Text("Row 3"); Text("Row 4") } }.frame(maxHeight: 400)
        case .list:
            List(0..<12, id: \.self) { i in Text("Row \\(i)") }.frame(maxHeight: 380)
        case .scrollView:
            ScrollView { VStack(alignment: .leading, spacing: 8) { ForEach(1...30, id: \.self) { i in Text("Item \(i)"); Divider() } }.padding(.horizontal) }.frame(maxHeight: 420)
        case .vstack:
            VStack { Text("Top"); Text("Bottom") }.frame(maxWidth: .infinity)
        case .hstack:
            HStack { Text("Left"); Text("Right") }.frame(maxWidth: .infinity)
        case .zstack:
            ZStack { Color.gray.opacity(0.15); Text("Centered") }.frame(height: 140).clipShape(RoundedRectangle(cornerRadius: 12))
        case .geometryReader:
            GeometryReader { geo in Text("Size: \\(Int(geo.size.width)) x \\(Int(geo.size.height))").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) }.frame(height: 120).background(.ultraThinMaterial).clipShape(RoundedRectangle(cornerRadius: 12))
        case .lazyVStack:
            ScrollView { LazyVStack { ForEach(1...20, id: \.self) { item in Text("LazyVStack row \\(item)") } } }.frame(maxHeight: 360)
        case .lazyHStack:
            ScrollView(.horizontal) { LazyHStack { ForEach(1...10, id: \.self) { item in Text("Tile \\(item)").padding().background(.thinMaterial).clipShape(RoundedRectangle(cornerRadius: 8)) } } }.frame(height: 120)
        case .lazyVGrid:
            let cols = [GridItem(.adaptive(minimum: 140), spacing: 12)]
            ScrollView { LazyVGrid(columns: cols, spacing: 12) { ForEach(1...12, id: \.self) { item in Text("Card \\(item)").frame(maxWidth: .infinity).padding().background(.thinMaterial).clipShape(RoundedRectangle(cornerRadius: 12)) } } }.frame(maxHeight: 420)
        case .lazyHGrid:
            let rows = [GridItem(.fixed(80))]
            ScrollView(.horizontal) { LazyHGrid(rows: rows, spacing: 12) { ForEach(1...12, id: \.self) { item in Text("Item \\(item)").frame(width: 140).padding().background(.thinMaterial).clipShape(RoundedRectangle(cornerRadius: 12)) } } }.frame(height: 120)
        case .navigationStack:
            NavigationStack { VStack(spacing: 16) { Text("Inside nested NavigationStack"); NavigationLink("Push") { Text("Pushed view") } } .padding() }
        case .navigationSplitView:
            NavigationSplitView { List(1...10, id: \.self) { item in Text("Sidebar \\(item)") }.navigationTitle("Sidebar") } detail: { Text("Detail").navigationTitle("Detail") }.frame(height: 420)
        case .tabView:
            TabView { Text("Tab 1").tabItem { Label("One", systemImage: "1.circle") }; Text("Tab 2").tabItem { Label("Two", systemImage: "2.circle") } }.frame(height: 420)
        case .menu:
            Menu("Menu button") { Button("First") {}; Button("Second") {} }
        case .toolbarItem:
            Text("ToolbarItem demo below").toolbar { ToolbarItem(placement: .topBarTrailing) { Button("Action") {} } }
        case .alert:
            AlertDemo()
        case .sheet:
            SheetDemo()
        case .confirmationDialog:
            ConfirmationDialogDemo()
        case .textField:
            TextField("Enter text", text: .constant("")).frame(maxWidth: 800)
        case .secureField:
            SecureField("Password", text: .constant("")).frame(maxWidth: 800)
        case .progressView:
            VStack(spacing: 12) { ProgressView(); ProgressView(value: 0.6) { Text("Progress") } }
        case .anyView:
            let v: AnyView = AnyView(Text("Wrapped in AnyView"))
            v
        case .disclosureGroup:
            Text("More info: Details inside disclosure group.").padding().background(.thinMaterial).clipShape(RoundedRectangle(cornerRadius: 12))
        case .controlGroup:
            ControlGroup { Button("A") {}; Button("B") {} }
        case .canvas:
            CanvasDemo()
        case .popover:
            Text("Popover is unavailable on tvOS").padding()
        case .table:
            Text("Table is unavailable on tvOS").font(.headline).foregroundStyle(.red)
            // Table' is unavailable in tvOS
            // Table(of: Person.self) {
            //     TableColumn("Name", value: \.name)
            //     TableColumn("Age") { person in
            //         Text("Age")
            //     }
            //     TableColumn("City", value: \.city)
            // } rows: {
            //     TableRow(Person(name: "John", age: 30, city: "NYC"))
            //     TableRow(Person(name: "Jane", age: 25, city: "LA"))
            // }
        case .slider,
            // Slider(value: $sliderValue, in: 0...100, step: 1)
            // 'Slider' is unavailable in tvOS
            // 'Slider' has been explicitly marked unavailable here (SwiftUI.Slider)
        .colorPicker,
            // ColorPicker("Choose Color", selection: $selectedColor)
            //'ColorPicker' is unavailable in tvOS
            //'ColorPicker' has been explicitly marked unavailable here (SwiftUI.ColorPicker)
        .stepper,
            // Stepper(value: $sliderValue, in: 0...10) {}
            //'Stepper' is unavailable in tvOS
            //'Stepper' has been explicitly marked unavailable here (SwiftUI.Stepper)
        .photosPicker:
            Text("\\(item.title) is unavailable on tvOS").font(.headline).foregroundStyle(.red)
            // 'PhotosPicker' is unavailable in tvOS
            // PhotosPickerDemo()
        }
    }
}

// MARK: - Helpers (Demos)

// private struct UnsupportedOnTvOSView: View {
//     let name: String
//     var body: some View { Text("\\(name) is unavailable on tvOS.").font(.headline).foregroundStyle(.red).frame(maxWidth: .infinity, alignment: .leading) }
// }

private struct AlertDemo: View { @State private var show = false; var body: some View { Button("Show Alert") { show = true }.alert("Hello", isPresented: $show) { Button("OK", role: .cancel) {} } } }

private struct SheetDemo: View { @State private var show = false; var body: some View { Button("Present Sheet") { show = true }.sheet(isPresented: $show) { Text("Sheet content").padding() } } }

private struct ConfirmationDialogDemo: View { @State private var show = false; var body: some View { Button("Confirm Action") { show = true }.confirmationDialog("Are you sure?", isPresented: $show, titleVisibility: .visible) { Button("Proceed", role: .destructive) {}; Button("Cancel", role: .cancel) {} } } }

private struct CanvasDemo: View {
    var body: some View {
        if #available(tvOS 16.0, *) {
            Canvas { ctx, size in
                let rect = CGRect(x: 20, y: 20, width: size.width - 40, height: 120)
                ctx.stroke(Path(roundedRect: rect, cornerRadius: 16), with: .color(.blue), lineWidth: 3)
                ctx.draw(Text("Canvas"), at: CGPoint(x: size.width/2, y: 80))
            }
            .frame(height: 160)
        } else {
            Text("Canvas requires tvOS 16+")
        }
    }
}

// private struct PhotosPickerDemo: View {
//     @State private var selectedItems: [PhotosPickerItem] = []
//     @State private var selectedImages: [Image] = []
    
//     var body: some View {
//         VStack(spacing: 20) {
//             Text("Photos Picker Demo")
//                 .font(.headline)
            
//             PhotosPicker(
//                 selection: $selectedItems,
//                 maxSelectionCount: 3,
//                 selectionBehavior: .ordered
//             ) {
//                 Label("Select Photos", systemImage: "photo.on.rectangle.angled")
//                     .font(.title2)
//                     .padding()
//                     .background(Color.blue.opacity(0.1))
//                     .clipShape(RoundedRectangle(cornerRadius: 12))
//             }
            
//             if !selectedImages.isEmpty {
//                 Text("Selected \(selectedImages.count) photo(s)")
//                     .font(.subheadline)
//                     .foregroundStyle(.secondary)
                
//                 ScrollView(.horizontal) {
//                     HStack(spacing: 12) {
//                         ForEach(0..<selectedImages.count, id: \.self) { index in
//                             selectedImages[index]
//                                 .resizable()
//                                 .scaledToFill()
//                                 .frame(width: 80, height: 80)
//                                 .clipShape(RoundedRectangle(cornerRadius: 8))
//                         }
//                     }
//                 }
//                 .frame(height: 100)
//             }
//         }
//         .onChange(of: selectedItems) { oldValue, newValue in
//             Task {
//                 selectedImages = []
//                 for item in newValue {
//                     if let data = try? await item.loadTransferable(type: Data.self),
//                        let uiImage = UIImage(data: data) {
//                         selectedImages.append(Image(uiImage: uiImage))
//                     }
//                 }
//             }
//         }
//     }
// }
