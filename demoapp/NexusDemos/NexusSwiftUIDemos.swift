//  NexusSwiftUIDemos.swift
//  41 SwiftUI components with tvOS-safe demos.

import SwiftUI
internal import Combine

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
    case animation = "Animation✅"
    case anyView = "AnyView✅"
    case asyncImage = "AsyncImage✅"
    case binding = "@Binding✅"
    case button = "Button✅"
    case canvas = "Canvas✅"
    case circle = "Circle✅"
    case color = "Color✅"
    case colorPicker = "ColorPicker❌"
    case confirmationDialog = "ConfirmationDialog✅"
    case controlGroup = "ControlGroup✅"
    case disclosureGroup = "DisclosureGroup✅"
    case divider = "Divider✅"
    case dragGesture = "DragGesture❌"
    case font = "Font✅"
    case forEach = "ForEach✅"
    case form = "Form✅"
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
    case longPressGesture = "LongPressGesture✅"
    case menu = "Menu✅"
    case navigationSplitView = "NavigationSplitView✅"
    case navigationStack = "NavigationStack✅"
    case navigationView = "NavigationView✅"
    case observedObject = "@ObservedObject✅"
    case photosPicker = "PhotosPicker❌"
    case picker = "Picker✅"
    case popover = "Popover❌"
    case progressView = "ProgressView✅"
    case published = "@Published✅"
    case roundedRectangle = "RoundedRectangle✅"
    case scrollView = "ScrollView✅"
    case section = "Section✅"
    case secureField = "SecureField✅"
    case shape = "Shape✅"
    case sheet = "Sheet✅"
    case slider = "Slider❌"
    case spacer = "Spacer✅"
    case state = "@State✅"
    case stateObject = "@StateObject✅"
    case stepper = "Stepper❌"
    case tabView = "TabView✅"
    case table = "Table❌"
    case tapGesture = "TapGesture✅"
    case text = "Text✅"
    case textField = "TextField✅"
    case timer = "Timer✅"
    case toggle = "Toggle✅"
    case toolbarItem = "ToolbarItem✅"
    case transition = "Transition✅"
    case view = "View✅"
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
                Button("Back to SwiftUI Overview") {
                    selectedOption = "SwiftUI Overview"
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
        case .alert:
            AlertDemo()
        case .animation:
            AnimationDemo()
        case .anyView:
            let v: AnyView = AnyView(Text("Wrapped in AnyView"))
            v
        case .asyncImage:
            AsyncImageDemo()
        case .binding:
            BindingDemo()
        case .button:
            Button("Tap me") { }.buttonStyle(.bordered)
        case .canvas:
            CanvasDemo()
        case .circle:
            Circle().fill(.blue).frame(width: 100, height: 100)
        case .color:
            Color.blue.frame(width: 200, height: 100).clipShape(RoundedRectangle(cornerRadius: 12))
        case .colorPicker:
            Text("ColorPicker is unavailable on tvOS").font(.headline).foregroundStyle(.red)
        case .confirmationDialog:
            ConfirmationDialogDemo()
        case .controlGroup:
            ControlGroup { Button("A") {}; Button("B") {} }
        case .disclosureGroup:
            Text("More info: Details inside disclosure group.").padding().background(.thinMaterial).clipShape(RoundedRectangle(cornerRadius: 12))
        case .divider:
            VStack { Text("Above"); Divider(); Text("Below") }
        case .dragGesture:
            DragGestureDemo()
        case .font:
            VStack { Text("Default Font"); Text("Custom Font").font(.custom("Arial", size: 20)) }
        case .forEach:
            VStack { ForEach(1...5, id: \.self) { i in Text("Item \(i)") } }
        case .form:
            Form { Section("Settings") { Text("Option 1"); Text("Option 2") } }.frame(maxHeight: 300)
        case .geometryReader:
            GeometryReader { geo in Text("Size: \(Int(geo.size.width)) x \(Int(geo.size.height))").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) }.frame(height: 120).background(.ultraThinMaterial).clipShape(RoundedRectangle(cornerRadius: 12))
        case .group:
            Group { Text("Inside Group") }.padding().overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray))
        case .hstack:
            HStack { Text("Left"); Text("Right") }.frame(maxWidth: .infinity)
        case .image:
            Image(systemName: "sparkles").resizable().scaledToFit().frame(width: 160, height: 160)
        case .label:
            Label("Downloads", systemImage: "arrow.down.circle").labelStyle(.titleAndIcon)
        case .lazyHGrid:
            let rows = [GridItem(.fixed(80))]
            ScrollView(.horizontal) { LazyHGrid(rows: rows, spacing: 12) { ForEach(1...12, id: \.self) { item in Text("Item \(item)").frame(width: 140).padding().background(.thinMaterial).clipShape(RoundedRectangle(cornerRadius: 12)) } } }.frame(height: 120)
        case .lazyHStack:
            ScrollView(.horizontal) { LazyHStack { ForEach(1...10, id: \.self) { item in Text("Tile \(item)").padding().background(.thinMaterial).clipShape(RoundedRectangle(cornerRadius: 8)) } } }.frame(height: 120)
        case .lazyVGrid:
            let cols = [GridItem(.adaptive(minimum: 140), spacing: 12)]
            ScrollView { LazyVGrid(columns: cols, spacing: 12) { ForEach(1...12, id: \.self) { item in Text("Card \(item)").frame(maxWidth: .infinity).padding().background(.thinMaterial).clipShape(RoundedRectangle(cornerRadius: 12)) } } }.frame(maxHeight: 420)
        case .lazyVStack:
            ScrollView { LazyVStack { ForEach(1...20, id: \.self) { item in Text("LazyVStack row \(item)") } } }.frame(maxHeight: 360)
        case .link:
            Link("Open Apple", destination: URL(string: "https://apple.com")!)
        case .list:
            List(0..<12, id: \.self) { i in Text("Row \(i)") }.frame(maxHeight: 380)
        case .longPressGesture:
            LongPressGestureDemo()
        case .menu:
            Menu("Menu button") { Button("First") {}; Button("Second") {} }
        case .navigationSplitView:
            NavigationSplitView { List(1...10, id: \.self) { item in Text("Sidebar \(item)") }.navigationTitle("Sidebar") } detail: { Text("Detail").navigationTitle("Detail") }.frame(height: 420)
        case .navigationStack:
            NavigationStack { VStack(spacing: 16) { Text("Inside nested NavigationStack"); NavigationLink("Push") { Text("Pushed view") } } .padding() }
        case .navigationView:
            NavigationViewDemo()
        case .observedObject:
            ObservedObjectDemo()
        case .photosPicker:
            Text("PhotosPicker is unavailable on tvOS").font(.headline).foregroundStyle(.red)
        case .picker:
            Picker("Select Option", selection: .constant("Option 1")) {
                Text("Option 1").tag("Option 1")
                Text("Option 2").tag("Option 2")
                Text("Option 3").tag("Option 3")
            }.pickerStyle(.menu)
        case .popover:
            Text("Popover is unavailable on tvOS").padding()
        case .progressView:
            VStack(spacing: 12) { ProgressView(); ProgressView(value: 0.6) { Text("Progress") } }
        case .published:
            PublishedDemo()
        case .roundedRectangle:
            RoundedRectangle(cornerRadius: 20).fill(.green).frame(width: 200, height: 100)
        case .scrollView:
            ScrollView { VStack(alignment: .leading, spacing: 8) { ForEach(1...30, id: \.self) { i in Text("Item \(i)"); Divider() } }.padding(.horizontal) }.frame(maxHeight: 420)
        case .section:
            List { Section("A") { Text("Row 1"); Text("Row 2") }; Section("B") { Text("Row 3"); Text("Row 4") } }.frame(maxHeight: 400)
        case .secureField:
            SecureField("Password", text: .constant("")).frame(maxWidth: 800)
        case .shape:
            ShapeDemo()
        case .sheet:
            SheetDemo()
        case .slider:
            Text("Slider is unavailable on tvOS").font(.headline).foregroundStyle(.red)
        case .spacer:
            HStack { Text("Left"); Spacer(); Text("Right") }.frame(maxWidth: .infinity)
        case .state:
            StateDemo()
        case .stateObject:
            StateObjectDemo()
        case .stepper:
            Text("Stepper is unavailable on tvOS").font(.headline).foregroundStyle(.red)
        case .tabView:
            TabView { Text("Tab 1").tabItem { Label("One", systemImage: "1.circle") }; Text("Tab 2").tabItem { Label("Two", systemImage: "2.circle") } }.frame(height: 420)
        case .table:
            Text("Table is unavailable on tvOS").font(.headline).foregroundStyle(.red)
        case .tapGesture:
            TapGestureDemo()
        case .text:
            Text("This is Text on tvOS").font(.title3)
        case .textField:
            TextField("Enter text", text: .constant("")).frame(maxWidth: 800)
        case .timer:
            TimerDemo()
        case .toggle:
            Toggle("Enable Option", isOn: .constant(true)).frame(maxWidth: 800)
        case .toolbarItem:
            Text("ToolbarItem demo below").toolbar { ToolbarItem(placement: .topBarTrailing) { Button("Action") {} } }
        case .transition:
            TransitionDemo()
        case .view:
            ViewDemo()
        case .vstack:
            VStack { Text("Top"); Text("Bottom") }.frame(maxWidth: .infinity)
        case .zstack:
            ZStack { Color.gray.opacity(0.15); Text("Centered") }.frame(height: 140).clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

// MARK: - Helpers (Demos)

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

private struct AnimationDemo: View {
    @State private var isAnimating = false
    var body: some View {
        VStack {
            Circle()
                .fill(.blue)
                .frame(width: 50, height: 50)
                .scaleEffect(isAnimating ? 1.5 : 1.0)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                .onAppear { isAnimating = true }
            Text("Animation Demo")
        }
    }
}

private struct AsyncImageDemo: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://picsum.photos/200/200")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            Text("AsyncImage Demo")
        }
    }
}

private struct BindingDemo: View {
    @State private var text = "Hello"
    var body: some View {
        VStack {
            Text("@Binding connects parent and child views")
            TextField("Edit text", text: $text)
            Text("Current: \(text)")
        }
    }
}

private struct DragGestureDemo: View {
    // 'DragGesture' is unavailable in tvOS
    var body: some View {
        VStack {
            Text("DragGesture is unavailable on tvOS")
            Text("tvOS uses remote control instead of touch gestures")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

private struct LongPressGestureDemo: View {
    @State private var isPressed = false
    var body: some View {
        VStack {
            Text("LongPressGesture Demo")
            Rectangle()
                .fill(isPressed ? .red : .blue)
                .frame(width: 100, height: 100)
                .onLongPressGesture {
                    isPressed.toggle()
                }
        }
    }
}

private struct NavigationViewDemo: View {
    var body: some View {
        VStack {
            Text("NavigationView (deprecated in iOS 16+)")
            Text("Use NavigationStack instead")
        }
    }
}

private struct ObservedObjectDemo: View {
    var body: some View {
        VStack {
            Text("@ObservedObject")
            Text("Used for external observable objects")
            Text("See @StateObject for owned objects")
        }
    }
}

private struct PublishedDemo: View {
    var body: some View {
        VStack {
            Text("@Published")
            Text("Property wrapper for ObservableObject")
            Text("Automatically publishes changes")
        }
    }
}

private struct ShapeDemo: View {
    var body: some View {
        VStack {
            Text("Shape Protocol")
            HStack {
                Rectangle().fill(.red).frame(width: 50, height: 50)
                Circle().fill(.green).frame(width: 50, height: 50)
                RoundedRectangle(cornerRadius: 10).fill(.blue).frame(width: 50, height: 50)
            }
        }
    }
}

private struct StateDemo: View {
    @State private var count = 0
    var body: some View {
        VStack {
            Text("@State Demo")
            Text("Count: \(count)")
            Button("Increment") { count += 1 }
        }
    }
}

private struct StateObjectDemo: View {
    var body: some View {
        VStack {
            Text("@StateObject")
            Text("Creates and owns ObservableObject")
            Text("Use for objects created in this view")
        }
    }
}

private struct TapGestureDemo: View {
    @State private var tapCount = 0
    var body: some View {
        VStack {
            Text("TapGesture Demo")
            Text("Taps: \(tapCount)")
                .padding()
                .background(.gray.opacity(0.3))
                .onTapGesture { tapCount += 1 }
        }
    }
}

private struct TimerDemo: View {
    @State private var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Timer Demo")
            Text("\(timeRemaining)")
                .font(.largeTitle)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
        }
    }
}

private struct TransitionDemo: View {
    @State private var showDetail = false
    var body: some View {
        VStack {
            Text("Transition Demo")
            Button("Toggle") { 
                withAnimation { showDetail.toggle() }
            }
            if showDetail {
                Text("Detail View")
                    .transition(.slide)
            }
        }
    }
}

private struct ViewDemo: View {
    var body: some View {
        VStack {
            Text("View Protocol")
            Text("All SwiftUI views conform to View")
            Text("Defines body property")
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

// Additional demo structs for new components
private struct ButtonDemo: View { @State private var count = 0; var body: some View { VStack { Text("Count: \(count)"); Button("Tap me!") { count += 1 } } } }
private struct CircleDemo: View { var body: some View { Circle().fill(.red).frame(width: 80, height: 80) } }
private struct ColorDemo: View { var body: some View { VStack { HStack { Color.red.frame(width: 50, height: 50); Color.green.frame(width: 50, height: 50); Color.blue.frame(width: 50, height: 50) }; Text("Color Demo") } } }
private struct FontDemo: View { var body: some View { VStack { Text("Title").font(.title); Text("Body").font(.body); Text("Caption").font(.caption) } } }
private struct ForEachDemo: View { private let items = ["Apple", "Banana", "Cherry"]; var body: some View { VStack { Text("ForEach Demo"); ForEach(items, id: \.self) { Text($0) } } } }
private struct FormDemo: View { @State private var name = ""; @State private var isEnabled = false; var body: some View { Form { TextField("Name", text: $name); Toggle("Enabled", isOn: $isEnabled) } } }
private struct PickerDemo: View { @State private var selection = 0; private let options = ["First", "Second", "Third"]; var body: some View { VStack { Picker("Choose", selection: $selection) { ForEach(0..<options.count, id: \.self) { Text(options[$0]) } }.pickerStyle(.segmented); Text("Selected: \(options[selection])") } } }
private struct RoundedRectangleDemo: View { var body: some View { RoundedRectangle(cornerRadius: 16).fill(.green).frame(width: 120, height: 80) } }
