//  NeuronUIKitDemos.swift
//  UIKit components focused on most commonly used elements with tvOS-safe demos.

import SwiftUI
import UIKit

// MARK: - UIKit Component Enum (Most Used Components)

enum NeuronUIKitComponent: String, CaseIterable, Identifiable {
    // Core UI Components (sorted by usage)
    case uiView = "UIView✅"
    case uiApplication = "UIApplication✅"
    case uiColor = "UIColor✅"
    case uiViewController = "UIViewController✅"
    case uiImage = "UIImage✅"
    case uiAlertAction = "UIAlertAction✅"
    case uiLabel = "UILabel✅"
    case uiScreen = "UIScreen✅"
    case uiFont = "UIFont✅"
    case uiAlertController = "UIAlertController✅"
    case uiButton = "UIButton✅"
    case uiTouch = "UITouch✅"
    case uiKeyCommand = "UIKeyCommand✅"
    case uiTextField = "UITextField✅"
    case uiImageView = "UIImageView✅"
    
    // Gesture Recognizers
    case uiTapGestureRecognizer = "UITapGestureRecognizer✅"
    case uiLongPressGestureRecognizer = "UILongPressGestureRecognizer✅"
    case uiGestureRecognizer = "UIGestureRecognizer✅"
    
    // Additional Components
    case uiWindow = "UIWindow✅"
    case uiTextView = "UITextView✅"
    case uiTableView = "UITableView✅"
    case uiWindowScene = "UIWindowScene✅"
    case uiContextMenuInteraction = "UIContextMenuInteraction✅"
    case uiHostingController = "UIHostingController✅"
    case uiVisualEffectView = "UIVisualEffectView✅"
    case uiCollectionView = "UICollectionView✅"
    case uiStoryboard = "UIStoryboard✅"
    case uiActivityIndicatorView = "UIActivityIndicatorView✅"
    
    // Representable Protocols
    case uiViewControllerRepresentable = "UIViewControllerRepresentable✅"
    case uiViewRepresentable = "UIViewRepresentable✅"

    var id: String { rawValue }
    var title: String { rawValue }
}

// MARK: - Detail Router

struct NeuronUIKitDetail: View {
    let item: NeuronUIKitComponent
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
            }.padding()
        }
        .navigationTitle(item.title)
    }

    @ViewBuilder
    private var demo: some View {
        switch item {
        case .uiView: NeuronUIViewDemo()
        case .uiApplication: NeuronUIApplicationDemo()
        case .uiColor: NeuronUIColorDemo()
        case .uiViewController: NeuronUIViewControllerDemo()
        case .uiImage: NeuronUIImageDemo()
        case .uiAlertAction: NeuronUIAlertActionDemo()
        case .uiLabel: NeuronUILabelDemo()
        case .uiScreen: NeuronUIScreenDemo()
        case .uiFont: NeuronUIFontDemo()
        case .uiAlertController: NeuronUIAlertControllerDemo()
        case .uiButton: NeuronUIButtonDemo()
        case .uiTouch: NeuronUITouchDemo()
        case .uiKeyCommand: NeuronUIKeyCommandDemo()
        case .uiTextField: NeuronUITextFieldDemo()
        case .uiImageView: NeuronUIImageViewDemo()
        case .uiTapGestureRecognizer: NeuronUITapGestureDemo()
        case .uiLongPressGestureRecognizer: NeuronUILongPressGestureDemo()
        case .uiGestureRecognizer: NeuronUIGestureRecognizerDemo()
        case .uiWindow: NeuronUIWindowDemo()
        case .uiTextView: NeuronUITextViewDemo()
        case .uiTableView: NeuronUITableViewDemo()
        case .uiWindowScene: NeuronUIWindowSceneDemo()
        case .uiContextMenuInteraction: NeuronUIContextMenuDemo()
        case .uiHostingController: NeuronUIHostingControllerDemo()
        case .uiVisualEffectView: NeuronUIVisualEffectDemo()
        case .uiCollectionView: NeuronUICollectionViewDemo()
        case .uiStoryboard: NeuronUIStoryboardDemo()
        case .uiActivityIndicatorView: NeuronUIActivityIndicatorDemo()
        case .uiViewControllerRepresentable: NeuronUIViewControllerRepresentableDemo()
        case .uiViewRepresentable: NeuronUIViewRepresentableDemo()
        }
    }
}

// MARK: - Core Demos

struct NeuronUIViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 12
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct NeuronUILabelDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "Neuron UILabel"
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIButtonDemo: UIViewRepresentable {
    class Coordinator {
        @objc func buttonTapped(_ sender: UIButton) {
            sender.setTitle("Neuron Tapped!", for: .normal)
        }
    }
    func makeCoordinator() -> Coordinator { Coordinator() }
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Neuron UIButton", for: .normal)
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .primaryActionTriggered)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        return button
    }
    func updateUIView(_ uiView: UIButton, context: Context) {}
}

struct NeuronUIImageViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView(image: UIImage(systemName: "brain.head.profile"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        return imageView
    }
    func updateUIView(_ uiView: UIImageView, context: Context) {}
}

struct NeuronUITextFieldDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = "Neuron input field"
        textField.borderStyle = .roundedRect
        textField.font = .preferredFont(forTextStyle: .body)
        return textField
    }
    func updateUIView(_ uiView: UITextField, context: Context) {}
}

struct NeuronUITextViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.text = "Neuron UITextView content for displaying longer text"
        textView.font = .preferredFont(forTextStyle: .body)
//        textView.isEditable = false
        // 'isEditable' is unavailable in tvOS

        return textView
    }
    func updateUIView(_ uiView: UITextView, context: Context) {}
}

// MARK: - Application & System Demos

struct NeuronUIApplicationDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        let app = UIApplication.shared
        label.text = "App State: \(app.applicationState == .active ? "Active" : "Background")"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIScreenDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        let screen = UIScreen.main
        let bounds = screen.bounds
        label.text = "Screen: \(Int(bounds.width)) x \(Int(bounds.height))\nScale: \(screen.scale)x"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIColorDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        let colors: [UIColor] = [.systemRed, .systemGreen, .systemBlue, .systemOrange]
        
        for (index, color) in colors.enumerated() {
            let colorView = UIView()
            colorView.backgroundColor = color
            colorView.frame = CGRect(x: index * 60, y: 0, width: 50, height: 50)
            colorView.layer.cornerRadius = 8
            containerView.addSubview(colorView)
        }
        
        containerView.frame = CGRect(x: 0, y: 0, width: 240, height: 50)
        return containerView
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct NeuronUIFontDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        
        let fonts: [(String, UIFont)] = [
            ("Title", .preferredFont(forTextStyle: .title1)),
            ("Headline", .preferredFont(forTextStyle: .headline)),
            ("Body", .preferredFont(forTextStyle: .body)),
            ("Caption", .preferredFont(forTextStyle: .caption1))
        ]
        
        for (name, font) in fonts {
            let label = UILabel()
            label.text = "\(name) Font"
            label.font = font
            stackView.addArrangedSubview(label)
        }
        
        return stackView
    }
    func updateUIView(_ uiView: UIStackView, context: Context) {}
}

// MARK: - Interactive Demos

struct NeuronUIAlertControllerDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let alert = UIAlertController(title: "Neuron Alert", message: "UIAlertController demo", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            vc.present(alert, animated: true)
        }
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct NeuronUIAlertActionDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIAlertAction is used within UIAlertController\nSee UIAlertController demo"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

// MARK: - Gesture Demos

struct NeuronUITapGestureDemo: UIViewRepresentable {
    class Coordinator {
        @objc func handleTap() {
            print("Neuron tap gesture recognized")
        }
    }
    func makeCoordinator() -> Coordinator { Coordinator() }
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 8
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap))
        view.addGestureRecognizer(tapGesture)
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct NeuronUILongPressGestureDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .systemPurple
        view.layer.cornerRadius = 8
        let longPressGesture = UILongPressGestureRecognizer()
        view.addGestureRecognizer(longPressGesture)
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct NeuronUIGestureRecognizerDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIGestureRecognizer is the base class\nSee specific gesture demos"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

// MARK: - Advanced Demos

struct NeuronUIViewControllerDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        //'systemBackground' is unavailable in tvOS
        vc.view.backgroundColor = .darkGray
        vc.title = "Neuron ViewController"
        
        let label = UILabel()
        label.text = "Custom UIViewController"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])
        
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct NeuronUIHostingControllerDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        UIHostingController(rootView: Text("Neuron SwiftUI inside UIHostingController"))
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct NeuronUIActivityIndicatorDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        indicator.color = .systemBlue
        return indicator
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct NeuronUIVisualEffectDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        //'systemMaterial' is unavailable in tvOS
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        
        let label = UILabel()
        label.text = "Blur Effect"
        label.textAlignment = .center
        label.frame = visualEffectView.bounds
        visualEffectView.contentView.addSubview(label)
        
        return visualEffectView
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

// MARK: - Collection Demos

struct NeuronUITableViewDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UITableViewController {
        class NeuronTableViewController: UITableViewController {
            let data = (1...10).map { "Neuron Row \($0)" }
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { data.count }
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.textLabel?.text = data[indexPath.row]
                return cell
            }
        }
        return NeuronTableViewController()
    }
    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {}
}

struct NeuronUICollectionViewDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        class DataSource: NSObject, UICollectionViewDataSource {
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 8 }
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                cell.contentView.backgroundColor = .systemBlue
                cell.contentView.layer.cornerRadius = 8
                return cell
            }
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        let dataSource = DataSource()
        collectionView.dataSource = dataSource
        
        let vc = UIViewController()
        vc.view = collectionView
        objc_setAssociatedObject(vc, "dataSource", dataSource, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

// MARK: - System & Protocol Demos

struct NeuronUIImageDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIImage is used with UIImageView\nSee UIImageView demo"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUITouchDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UITouch handles touch events\nUse gesture recognizers for touch handling"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIKeyCommandDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        class KeyCommandViewController: UIViewController {
            override var keyCommands: [UIKeyCommand]? {
                [UIKeyCommand(input: UIKeyCommand.inputUpArrow, modifierFlags: [], action: #selector(handleKeyCommand))]
            }
            @objc func handleKeyCommand() {
                print("Neuron key command handled")
            }
        }
        return KeyCommandViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct NeuronUIWindowDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            label.text = "Window Scene: \(window.session.configuration.name ?? "Unknown")"
        } else {
            label.text = "UIWindow manages view hierarchy"
        }
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIWindowSceneDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIWindowScene manages app's UI\nAvailable in iOS 13+ and tvOS 13+"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIContextMenuDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIContextMenuInteraction provides\ncontext menu functionality"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIStoryboardDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIStoryboard loads view controllers\nfrom storyboard files"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIViewRepresentableDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIViewRepresentable protocol\nwraps UIKit views in SwiftUI"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIViewControllerRepresentableDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIViewControllerRepresentable protocol\nwraps UIKit view controllers in SwiftUI"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}
