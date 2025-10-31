//
//  ContentView.swift
//  demoapp
//
//  Created by victor.chen on 2025/10/23.
//

import SwiftUI

// MARK: - Option Views
struct Option1View: View {
    let tvOSVersion: String
    let onBack: () -> Void
    
    var body: some View {
        VStack {
            Text("Option 1 View")
            Text("tvOS Version: \(tvOSVersion)")
            Spacer()
        }
        .navigationTitle("Option 1")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back to Menu") {
                    onBack()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct Option2View: View {
    let tvOSVersion: String
    let onBack: () -> Void
    
    var body: some View {
        VStack {
            Text("Option 2 View")
            Text("tvOS Version: \(tvOSVersion)")
            Spacer()
        }
        .navigationTitle("Option 2")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back to Menu") {
                    onBack()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct Option3View: View {
    let tvOSVersion: String
    let onBack: () -> Void
    @State private var selectedSubOption = "Sub Option A"
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Option 3 View - Menu Style")
                Text("tvOS Version: \(tvOSVersion)")
                
                Text("Selected: \(selectedSubOption)")
                
                List {
                    NavigationLink("Sub Option A") {
                        SubOptionView(title: "Sub Option A", tvOSVersion: tvOSVersion)
                    }
                    NavigationLink("Sub Option B") {
                        SubOptionView(title: "Sub Option B", tvOSVersion: tvOSVersion)
                    }
                    NavigationLink("Sub Option C") {
                        SubOptionView(title: "Sub Option C", tvOSVersion: tvOSVersion)
                    }

                    Section("Nexus") {
                        NavigationLink("NexusiOSSwiftUI component test") {
                            NexusSwiftUIComponentListView()
                        }
                        NavigationLink("NexusiOSUIKit component test") {
                            NexusUIKitComponentListView()
                        }
                    }
                }
                .navigationTitle("Sub Options")
                
                Spacer()
            }
            .padding()
            .navigationTitle("Option 3 (Menu Style)")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back to Menu") {
                        onBack()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct SubOptionView: View {
    let title: String
    let tvOSVersion: String
    
    var body: some View {
        VStack {
            Text("\(title) Detail")
            Text("tvOS Version: \(tvOSVersion)")
            Spacer()
        }
        .navigationTitle(title)
    }
}
struct TabViewTestPage: View {
    let tvOSVersion: String
    let onBack: () -> Void
    @State private var selectedTab = 0
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            Text("TabView Focus Test")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Use left/right arrows to navigate between tabs")
                // .font(.title3)
                .foregroundColor(.secondary)
            
            TabView(selection: $selectedTab) {
                VStack(spacing: 30) {
                    Text("Tab 1 Content")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("First tab view")
                        .font(.title2)
                    Text("Current selection: \(selectedTab)")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    Button("Tab 1 Action") {
                        print("Tab 1 button tapped")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                .tag(0)
                .tabItem {
                    Image(systemName: "1.circle.fill")
                    Text("Tab 1")
                }
                
                VStack(spacing: 30) {
                    Text("Tab 2 Content")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Second tab view")
                        .font(.title2)
                    Text("Current selection: \(selectedTab)")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    Button("Tab 2 Action") {
                        print("Tab 2 button tapped")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                .tag(1)
                .tabItem {
                    Image(systemName: "2.circle.fill")
                    Text("Tab 2")
                }
                
                VStack(spacing: 30) {
                    Text("Tab 3 Content")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Third tab view")
                        .font(.title2)
                    Text("Current selection: \(selectedTab)")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    Button("Tab 3 Action") {
                        print("Tab 3 button tapped")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                .tag(2)
                .tabItem {
                    Image(systemName: "3.circle.fill")
                    Text("Tab 3")
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button("Back to Previous Page") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.bottom, 50)
        }
        .padding(40)
        .navigationTitle("TabView Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
        }
    }
}

struct FocusableMenu: View {
    var body: some View {
        Menu {
            Button("Settings") { print("Settings tapped") }
            Menu("Streaming") {
                Button("YouTube") { print("YouTube tapped") }
                Button("Facebook Live") { print("Facebook Live tapped") }
            }
        } label: {
            Image(systemName: "ellipsis.circle.fill")
                .font(.title)
        }
    }
}

// MARK: - Main ContentView
struct ContentView: View {
    @State private var isEnabled = false
    @State private var selectedMode = "1080p"
    @State private var showOverlay = false
    @State private var inputText = ""
    @FocusState private var focused: Bool
    @State private var selectedOption: String? = nil
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    

    var tvOSVersion: String {
        UIDevice.current.systemVersion
    }

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List {
                Button("Test Page") {
                    selectedOption = "Test Page"
                }
                
                Button("TabView") {
                    selectedOption = "TabView Test"
                }
                
                // Button("Option 1") {
                //     selectedOption = "Option 1"
                // }
                
                // Button("Option 2") {
                //     selectedOption = "Option 2"
                // }
                
                // Button("Option 3 (Menu Style)") {
                //     selectedOption = "Option 3"
                // }

                Section("Nexus Components") {
                    Button("SwiftUI Test") {
                        selectedOption = "SwiftUI Overview"
                    }
                    
                    Button("UIKit Test") {
                        selectedOption = "UIKit Overview"
                    }
                }
                
                Section("Neuron Components") {
                    Button("SwiftUI Test") {
                        selectedOption = "Neuron SwiftUI Overview"
                    }
                    
                    Button("UIKit Test") {
                        selectedOption = "Neuron UIKit Overview"
                    }
                }
            }
            .font(.title3) 
            // .navigationSplitViewColumnWidth(min: 660, ideal: 720, max: 800) // 用有限範圍，別用 .infinity
            // .navigationSplitViewStyle(.balanced)
            // navigationSplitViewStyle .balanced doesn't work in tvOS
            // navigationsplitViewColumnWidth doesn't affect liquid glass well in tvOS
  
            .navigationTitle("Nexus Components")
            .listStyle(.sidebar)
            //.listStyle(.sidebar) 'sidebar' is unavailable in tvOS

        } detail: {
            Group {
                if let option = selectedOption {
                    switch option {
                    case "Test Page":
                        TestView(tvOSVersion: tvOSVersion)
                    case "TabView Test":
                        TabViewTestPage(tvOSVersion: tvOSVersion, onBack: { selectedOption = nil })
                    case "Option 1":
                        Option1View(tvOSVersion: tvOSVersion, onBack: { selectedOption = nil })
                    case "Option 2":
                        Option2View(tvOSVersion: tvOSVersion, onBack: { selectedOption = nil })
                    case "Option 3":
                        Option3View(tvOSVersion: tvOSVersion, onBack: { selectedOption = nil })
                    case "SwiftUI Overview":
                        SwiftUIComponentsOverview(selectedOption: $selectedOption)
                    case "UIKit Overview":
                        UIKitComponentsOverview(selectedOption: $selectedOption)
                    case "Neuron SwiftUI Overview":
                        NeuronSwiftUIComponentsOverview(selectedOption: $selectedOption)
                    case "Neuron UIKit Overview":
                        NeuronUIKitComponentsOverview(selectedOption: $selectedOption)
                    case let option where option.starts(with: "Nexus SwiftUI: "):
                        let componentRawValue = String(option.dropFirst("Nexus SwiftUI: ".count))
                        if let component = NexusSwiftUIComponent(rawValue: componentRawValue) {
                            NavigationStack {
                                NexusSwiftUIDetail(item: component, selectedOption: $selectedOption)
                            }
                        } else {
                            WelcomeView(columnVisibility: $columnVisibility)
                        }
                    case let option where option.starts(with: "Nexus UIKit: "):
                        let componentRawValue = String(option.dropFirst("Nexus UIKit: ".count))
                        if let component = NexusUIKitComponent(rawValue: componentRawValue) {
                            NavigationStack {
                                NexusUIKitDetail(item: component, selectedOption: $selectedOption)
                            }
                        } else {
                            WelcomeView(columnVisibility: $columnVisibility)
                        }
                    case let option where option.starts(with: "Neuron SwiftUI: "):
                        let componentRawValue = String(option.dropFirst("Neuron SwiftUI: ".count))
                        if let component = NeuronSwiftUIComponent(rawValue: componentRawValue) {
                            NavigationStack {
                                NeuronSwiftUIDetail(item: component, selectedOption: $selectedOption)
                            }
                        } else {
                            WelcomeView(columnVisibility: $columnVisibility)
                        }
                    case let option where option.starts(with: "Neuron UIKit: "):
                        let componentRawValue = String(option.dropFirst("Neuron UIKit: ".count))
                        if let component = NeuronUIKitComponent(rawValue: componentRawValue) {
                            NavigationStack {
                                NeuronUIKitDetail(item: component, selectedOption: $selectedOption)
                            }
                        } else {
                            WelcomeView(columnVisibility: $columnVisibility)
                        }
                    default:
                        WelcomeView(columnVisibility: $columnVisibility)
                    }
                } else {
                    WelcomeView(columnVisibility: $columnVisibility)
                }
            }
        }
    }
}

// MARK: - Detail Content TestView
struct TestView: View {
    let tvOSVersion: String
    @State private var isEnabled = false
    @State private var selectedMode = "1080p"
    @State private var showOverlay = false
    @State private var inputText = ""
    @FocusState private var focused: Bool
    @State private var showAlert = false
    @State private var showConfirmationDialog = false
    @State private var progressValue: Double = 0.5
    @State private var sliderValue: Double = 50.0
    @State private var selectedColor: Color = .blue
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    // 1️⃣ Native Navigation
                    Text("1️⃣ Native NavigationStack ✅ navigationTitle shown above")

                    // 2️⃣ Native Toolbar
                    Text("2️⃣ Native Toolbar ✅ using .toolbar modifier")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                FocusableMenu()
                            }
                        }

                    // 3️⃣ Native ScrollView
                    Text("3️⃣ Native ScrollView ✅ this page is scrollable")

                    // 4️⃣ Native Button
                    HStack {
                        Text("4️⃣ Native Button ✅ focus & click ok")
                        Spacer()
                        Button("Native Button") {
                            print("Native Button tapped")
                        }
                        .buttonStyle(.borderedProminent)
                    }

                    // 5️⃣ Native TextField
                    HStack {
                        Text("5️⃣ Native TextField ✅ ")
                        Spacer()
                        TextField("Enter text...", text: $inputText)
                            .padding(8)
                            .frame(width: 300)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(6)
                            // .disabled(true) // tvOS 無法直接輸入
                    }

                    // 6️⃣ Native ColorPicker
                    // Button(action: {
                    //     // This is just a focusable text, no action needed
                    // }) {
                        HStack {
                            Text("6️⃣ Native ColorPicker tvOS doesn't support(compile error) ❌")
                            Spacer()
                            // ColorPicker("Choose Color", selection: $selectedColor)
                            //'ColorPicker' is unavailable in tvOS
                            //'ColorPicker' has been explicitly marked unavailable here (SwiftUI.ColorPicker)
                            Text("'ColorPicker' is unavailable in tvOS")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                    // }
                    // .buttonStyle(.borderedProminent)
                    // .allowsHitTesting(false)

                    // 7️⃣ Native Toolbar Menu
                    HStack {
                        Text("7️⃣ Native Toolbar Menu (Menu)  ✅")
                        Spacer()
                        FocusableMenu()
                    }

                    // 8️⃣ Native Toggle
                    HStack {
                        Text("8️⃣ Native Toggle , switch ✅ , focus with remote controller ✅")
                        Spacer()
                        Toggle(isOn: $isEnabled) {
                            Text("Toggle Test")
                                .foregroundColor(.white)
                        }
                        .toggleStyle(.switch)
                        .padding(.horizontal, 10)
                        .frame(width: 400, height: 50)
                        .background(isEnabled ? Color.white.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                        .onTapGesture {
                            isEnabled.toggle()
                            print("Native Toggle switched to: \(isEnabled)")
                        }
                    }

                    // 9️⃣ Native Picker
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("9️⃣ Picker (Menu), focused ok ✅ dropdown menu ok ✅")
                            Spacer()
                            Picker("Quality", selection: $selectedMode) {
                                Text("720p").tag("720p")
                                Text("1080p").tag("1080p")
                                Text("4K").tag("4K")
                            }
                            .pickerStyle(.menu)
                        }
                        HStack {
                            Text("🔟 Picker (Segmented) ✅ ")
                            Spacer()
                            Picker("Quality", selection: $selectedMode) {
                                Text("Option1").tag("Option1")
                                Text("Option2").tag("Option2")
                                Text("Option3").tag("Option3")
                            }
                            .pickerStyle(.segmented)
                            .fixedSize()
                        }
                    }

                    // 1️⃣1️⃣ Context Menu
                    HStack {
                        Text("1️⃣1️⃣ Context Menu (Long Press) ✅")
                        Spacer()
                        Button("Show Options") {
                            print("Button tapped normally")
                        }
                        .buttonStyle(.borderedProminent)
                        .contextMenu {
                            Button("Restart Stream") { print("Restart stream tapped") }
                            Button("Disconnect") { print("Disconnect tapped") }
                            Toggle("Show Overlay", isOn: $showOverlay)
                            Picker("Bitrate", selection: $selectedMode) {
                                Text("Option1").tag("Option1")
                                Text("Option2").tag("Option2")
                                Text("Option3").tag("Option3")
                            }
                        }
                    }

                    // 1️⃣2️⃣ Overlay Test
                    HStack {
                        Text("1️⃣2️⃣ Overlay (moved .overlay to VStack) ✅")
                        Spacer()
                        Button(action: {
                            showOverlay.toggle()
                            print("showOverlay toggled to: \(showOverlay)")
                        }) {
                            Text(showOverlay ? "Hide Overlay" : "Show Overlay")
                        }
                        .buttonStyle(.borderedProminent)
                    }

                    // 1️⃣3️⃣ Alert Test
                    HStack {
                        Text("1️⃣3️⃣ Alert (System AlertView) ✅")
                        Spacer()
                        Button("Show Alert") {
                            showAlert = true
                            print("Alert button tapped")
                        }
                        .buttonStyle(.borderedProminent)
                        .alert("Native Alert", isPresented: $showAlert) {
                            Button("ok", role: .cancel) {
                                print("Alert: ok button tapped")
                            }
                            Button("cancel") {
                                print("Alert: cancel button tapped")
                            }
                            // Button("delete", role: .destructive) {
                            //     print("Alert: delete button tapped")
                            // }
                        } message: {
                            Text("This is an alert message.")
                        }
                    }

                    // 1️⃣4️⃣ ConfirmationDialog Test (ActionSheet on iOS, similar on tvOS)
                    HStack {
                        Text("1️⃣4️⃣ ConfirmationDialog (like ActionSheet) ✅")
                        Spacer()
                        Button("Show Options") {
                            showConfirmationDialog = true
                            print("ConfirmationDialog button tapped")
                        }
                        .buttonStyle(.borderedProminent)
                        .confirmationDialog("Selection Option", isPresented: $showConfirmationDialog) {
                            Button("Option 1") {
                                print("ConfirmationDialog: Option 1 tapped")
                            }
                            Button("Option 2") {
                                print("ConfirmationDialog: Option 2 tapped")
                            }
                            Button("Option 3", role: .destructive) {
                                print("ConfirmationDialog: Option 3 tapped")
                            }
                            Button("Option 4", role: .cancel) {
                                print("ConfirmationDialog: Option 4 tapped")
                            }
                        } message: {
                            Text("Please select an action to perform")
                        }
                    }

                    // 1️⃣5️⃣ Native List
                    VStack(alignment: .leading, spacing: 10) {
                        Button(action: {
                            // This is just a focusable text, no action needed
                        }) {
                            Text("1️⃣5️⃣ Native List ✅")
                        }
                        .buttonStyle(.plain)
                        .allowsHitTesting(false)
                        
                        List {
                            Text("List Item 1")
                            Text("List Item 2") 
                            Text("List Item 3")
                            HStack {
                                Text("Item with Button")
                                Spacer()
                                Button("Action") {
                                    print("List item button tapped")
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                        .frame(height: 200)
                    }
                    Spacer()
                    // 1️⃣6️⃣ Native TabView with Focus Fix
                    HStack {
                        Text("1️⃣6️⃣ Native TabView ✅ ")
                        Spacer()
                        NavigationLink(destination: TabViewTestPage(tvOSVersion: tvOSVersion, onBack: {})) {
                            Text("Go to TabView Test Page")
                        }
                        .buttonStyle(.borderedProminent)
                    }

                    // 1️⃣7️⃣ Native Stepper (Not Available)
                    Button(action: {
                        // This is just a focusable text, no action needed
                    }) {
                        HStack {
                            Text("1️⃣7️⃣ Native Stepper tvOS doesn't support (compile error) ❌")
                            Spacer()
                            // Stepper(value: $sliderValue, in: 0...10) {}
                            //'Stepper' is unavailable in tvOS
                            //'Stepper' has been explicitly marked unavailable here (SwiftUI.Stepper)
                            Text("'Stepper' is unavailable in tvOS")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                    }
                    .buttonStyle(.plain)
                    .allowsHitTesting(false) // 阻止點擊但保持可聚焦

                    // 1️⃣8️⃣ Native Slider (Not Available) 
                    Button(action: {
                        // This is just a focusable text, no action needed
                    }) {
                        HStack {
                            Text("1️⃣8️⃣ Native Slider tvOS doesn't support (compile error) ❌")
                            Spacer()
                            // Slider(value: $sliderValue, in: 0...100, step: 1)
                            // 'Slider' is unavailable in tvOS
                            // 'Slider' has been explicitly marked unavailable here (SwiftUI.Slider)
                            Text("'Slider' is unavailable in tvOS")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                    }
                    .buttonStyle(.plain)
                    .allowsHitTesting(false) // 阻止點擊但保持可聚焦

                    // 移除不需要的橋樑按鈕

                    // 1️⃣9️⃣ Native ProgressView
                    VStack(alignment: .leading, spacing: 10) {
                        Text("1️⃣9️⃣ Native ProgressView ✅")
                        
                        HStack {
                            Text("Indeterminate:")
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .buttonStyle(.borderedProminent)
                        }
                        
                        HStack {
                            Text("Progress: \(Int(progressValue * 100))%")
                            Spacer()
                            ProgressView(value: progressValue)
                                .frame(width: 300)
                        }
                        
                        Button("Update Progress") {
                            withAnimation {
                                progressValue = progressValue >= 1.0 ? 0.0 : progressValue + 0.2
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }

                    // 2️⃣0️⃣ Tips Section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("2️⃣0️⃣ tvOS Focus Management Tips")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("• System Focus First: tvOS built-in focus system is comprehensive, avoid custom focus management")
                            Text("• Avoid Conflicting Modifiers: Don't use .focused() and .focusable() together")
                            Text("• Trust Built-in Components: Button, Menu, Toggle, Picker have complete focus support")
                            Text("• .borderedProminent Style: Includes built-in focus effects, no extra focus management needed")
                            // Text("• Use .fixedSize(): Let components auto-size based on content, more flexible than fixed sizes")
                            Text("• TabView Focus Fix: Wrap TabView with Button(.plain) to make it focusable from other elements")
                            Text("• tvOS Limitations: ColorPicker, Stepper and Slider components are not available on tvOS platform")
                            Text("• navigationSplitViewStyle .balanced doesn't work in tvOS")
                            Text("• navigationSplitViewColumnWidth doesn't affect liquid glass well in tvOS")
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.leading, 10)
                    }
                    .padding(20)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
                // ✅ overlay moved to container
                .overlay(alignment: .topTrailing) {
                    if showOverlay {
                        Text("Overlay Content")
                            .padding(8)
                            .background(Color.red.opacity(0.9))
                            .cornerRadius(8)
                            .transition(.opacity)
                            .zIndex(10)
                            .padding(.top, 10)
                            .padding(.trailing, 20)
                    }
                }
            }
            .navigationTitle("(NavigationTitle)SwiftUI Native API Test (tvOS \(tvOSVersion))")
        }
    }
}

// MARK: - Welcome View
struct WelcomeView: View {
    @Binding var columnVisibility: NavigationSplitViewVisibility
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Nexus Components Test")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Please select a test type from the sidebar:")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("• SwiftUI Test - View all SwiftUI components")
                Text("• UIKit Test - View all UIKit components")
                Text("• Neuron SwiftUI Test - View most used SwiftUI components")
                Text("• Neuron UIKit Test - View most used UIKit components")
            }
            .padding(.leading, 20)
            
            Button("Show Sidebar") {
                columnVisibility = .doubleColumn
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Welcome")
    }
}

// MARK: - SwiftUI Components Overview
struct SwiftUIComponentsOverview: View {
    @Binding var selectedOption: String?
    
    let columns = [
        GridItem(.adaptive(minimum: 190), spacing: 10)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(NexusSwiftUIComponent.allCases, id: \.id) { component in
                        Button(action: {
                            selectedOption = "Nexus SwiftUI: \(component.rawValue)"
                        }) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(component.title)
                                    .font(.body) // 組件名稱字型
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.5) // 最小縮放到 50%
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                // Text(component.title.contains("✅") ? "Supported" : "Not Supported")
                                //     // .font(.caption) // 支援狀態字型
                                //     .font(.system(size: 12)) 
                                //     .foregroundColor(component.title.contains("✅") ? .green : .red)
                            }
                            .frame(minHeight: 70)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 1)   // 上下 12 點間距
                            .padding(.horizontal, 1) // 左右 16 點間距
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(component.title.contains("✅") ? 
                                          Color.green.opacity(0.1) : 
                                          Color.red.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(component.title.contains("✅") ? 
                                           Color.green.opacity(0.3) : 
                                           Color.red.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Nexus SwiftUI Components")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        selectedOption = nil
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

// MARK: - UIKit Components Overview
struct UIKitComponentsOverview: View {
    @Binding var selectedOption: String?
    
    let columns = [
        GridItem(.adaptive(minimum: 190), spacing: 10)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(NexusUIKitComponent.allCases, id: \.id) { component in
                        Button(action: {
                            selectedOption = "Nexus UIKit: \(component.rawValue)"
                        }) {
                            VStack(alignment: .leading, spacing:0) {
                                Text(component.title)
                                .font(.body) // 組件名稱字型
                                    // .font(.system(size: 20)) // 組件名稱字型
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.5) // 最小縮放到 50%
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                // Text(component.title.contains("✅") ? "Supported" : "Not Supported")
                                //     .font(.system(size: 12)) // 支援狀態字型
                                //     .foregroundColor(component.title.contains("✅") ? .green : .red)
                            }
                            .frame(minHeight: 70)
                            .frame(maxWidth: .infinity)
                            // .padding()
                            .padding(.vertical, 1)   // 上下 12 點間距
                            .padding(.horizontal, 1) // 左右 16 點間距
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(component.title.contains("✅") ? 
                                          Color.green.opacity(0.1) : 
                                          Color.red.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(component.title.contains("✅") ? 
                                           Color.green.opacity(0.3) : 
                                           Color.red.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Nexus UIKit Components")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        selectedOption = nil
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

// MARK: - Neuron SwiftUI Components Overview
struct NeuronSwiftUIComponentsOverview: View {
    @Binding var selectedOption: String?
    
    let columns = [
        GridItem(.adaptive(minimum: 190), spacing: 10)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(NeuronSwiftUIComponent.allCases, id: \.id) { component in
                        Button(action: {
                            selectedOption = "Neuron SwiftUI: \(component.rawValue)"
                        }) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(component.title)
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                // Text("Supported")
                                //     .font(.system(size: 12))
                                //     .foregroundColor(.green)
                            }
                            .frame(minHeight: 70)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 1)   // 上下 12 點間距
                            .padding(.horizontal, 1) // 左右 16 點間距
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.green.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Neuron SwiftUI Components")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        selectedOption = nil
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

// MARK: - Neuron UIKit Components Overview
struct NeuronUIKitComponentsOverview: View {
    @Binding var selectedOption: String?
    
    let columns = [
        GridItem(.adaptive(minimum: 190), spacing: 10)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(NeuronUIKitComponent.allCases, id: \.id) { component in
                        Button(action: {
                            selectedOption = "Neuron UIKit: \(component.rawValue)"
                        }) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(component.title)
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.5)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                // Text("Supported")
                                //     .font(.system(size: 12))
                                //     .foregroundColor(.green)
                            }
                            .frame(minHeight: 70)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 1)   // 上下 12 點間距
                            .padding(.horizontal, 1) // 左右 16 點間距
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.green.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Neuron UIKit Components")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        selectedOption = nil
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
