//  NeuronUIKitDemos.swift
//  UIKit components focused on most commonly used elements with tvOS-safe demos.

import SwiftUI
import UIKit

// MARK: - UIKit Component Enum (41 Components)

enum NeuronUIKitComponent: String, CaseIterable, Identifiable {
    // Core UI Components (sorted alphabetically)
    case uiActivityIndicatorView = "UIActivityIndicatorView✅"
    case uiAlertAction = "UIAlertAction✅"
    case uiAlertController = "UIAlertController✅"
    case uiApplication = "UIApplication✅"
    case uiButton = "UIButton✅"
    case uiCollectionView = "UICollectionView✅"
    case uiColor = "UIColor✅"
    case uiContextMenuInteraction = "UIContextMenuInteraction✅"
    case uiDatePicker = "UIDatePicker❌"
    case uiFont = "UIFont✅"
    case uiGestureRecognizer = "UIGestureRecognizer✅"
    case uiHostingController = "UIHostingController✅"
    case uiImage = "UIImage✅"
    case uiImageView = "UIImageView✅"
    case uiKeyCommand = "UIKeyCommand✅"
    case uiLabel = "UILabel✅"
    case uiLongPressGestureRecognizer = "UILongPressGestureRecognizer✅"
    case uiNavigationController = "UINavigationController✅"
    case uiPageControl = "UIPageControl✅"
    case uiPickerView = "UIPickerView❌"
    case uiProgressView = "UIProgressView✅"
    case uiScreen = "UIScreen✅"
    case uiScrollView = "UIScrollView✅"
    case uiSegmentedControl = "UISegmentedControl✅"
    case uiSlider = "UISlider❌"
    case uiStepper = "UIStepper❌"
    case uiStoryboard = "UIStoryboard✅"
    case uiSwitch = "UISwitch✅"
    case uiTabBarController = "UITabBarController✅"
    case uiTableView = "UITableView✅"
    case uiTapGestureRecognizer = "UITapGestureRecognizer✅"
    case uiTextField = "UITextField✅"
    case uiTextView = "UITextView✅"
    case uiTouch = "UITouch✅"
    case uiView = "UIView✅"
    case uiViewController = "UIViewController✅"
    case uiViewControllerRepresentable = "UIViewControllerRepresentable✅"
    case uiViewRepresentable = "UIViewRepresentable✅"
    case uiVisualEffectView = "UIVisualEffectView✅"
    case uiWindow = "UIWindow✅"
    case uiWindowScene = "UIWindowScene✅"

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
                Button("Back to Neuron UIKit Overview") {
                    selectedOption = "Neuron UIKit Overview"
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
        case .uiActivityIndicatorView: NeuronUIActivityIndicatorDemo()
        case .uiAlertAction: NeuronUIAlertActionDemo()
        case .uiAlertController: NeuronUIAlertControllerDemo()
        case .uiApplication: NeuronUIApplicationDemo()
        case .uiButton: NeuronUIButtonDemo()
        case .uiCollectionView: NeuronUICollectionViewDemo()
        case .uiColor: NeuronUIColorDemo()
        case .uiContextMenuInteraction: NeuronUIContextMenuDemo()
        case .uiDatePicker: NeuronUIDatePickerDemo()
        case .uiFont: NeuronUIFontDemo()
        case .uiGestureRecognizer: NeuronUIGestureRecognizerDemo()
        case .uiHostingController: NeuronUIHostingControllerDemo()
        case .uiImage: NeuronUIImageDemo()
        case .uiImageView: NeuronUIImageViewDemo()
        case .uiKeyCommand: NeuronUIKeyCommandDemo()
        case .uiLabel: NeuronUILabelDemo()
        case .uiLongPressGestureRecognizer: NeuronUILongPressGestureDemo()
        case .uiNavigationController: NeuronUINavigationControllerDemo()
        case .uiPageControl: NeuronUIPageControlDemo()
        case .uiPickerView: NeuronUIPickerViewDemo()
        case .uiProgressView: NeuronUIProgressViewDemo()
        case .uiScreen: NeuronUIScreenDemo()
        case .uiScrollView: NeuronUIScrollViewDemo()
        case .uiSegmentedControl: NeuronUISegmentedControlDemo()
        case .uiSlider: NeuronUISliderDemo()
        case .uiStepper: NeuronUIStepperDemo()
        case .uiStoryboard: NeuronUIStoryboardDemo()
        case .uiSwitch: NeuronUISwitchDemo()
        case .uiTabBarController: NeuronUITabBarControllerDemo()
        case .uiTableView: NeuronUITableViewDemo()
        case .uiTapGestureRecognizer: NeuronUITapGestureDemo()
        case .uiTextField: NeuronUITextFieldDemo()
        case .uiTextView: NeuronUITextViewDemo()
        case .uiTouch: NeuronUITouchDemo()
        case .uiView: NeuronUIViewDemo()
        case .uiViewController: NeuronUIViewControllerDemo()
        case .uiViewControllerRepresentable: NeuronUIViewControllerRepresentableDemo()
        case .uiViewRepresentable: NeuronUIViewRepresentableDemo()
        case .uiVisualEffectView: NeuronUIVisualEffectDemo()
        case .uiWindow: NeuronUIWindowDemo()
        case .uiWindowScene: NeuronUIWindowSceneDemo()
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

// MARK: - New Component Demos

struct NeuronUIDatePickerDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIDatePicker is unavailable on tvOS"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUINavigationControllerDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UINavigationController manages\nnavigation stack for view controllers"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIPageControlDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 2
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .blue
        return pageControl
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {}
}

struct NeuronUIPickerViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIPickerView is unavailable on tvOS"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIProgressViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progress = 0.65
        progressView.progressTintColor = .blue
        progressView.trackTintColor = .lightGray
        return progressView
    }
    func updateUIView(_ uiView: UIProgressView, context: Context) {}
}

struct NeuronUIScrollViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        //'systemGray6' is unavailable in tvOS
        scrollView.backgroundColor = .darkGray
        
        let contentView = UIView()
        contentView.backgroundColor = .systemBlue
        contentView.frame = CGRect(x: 0, y: 0, width: 800, height: 400)
        
        let label = UILabel()
        label.text = "Scrollable Content Area\nSwipe to scroll"
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.frame = CGRect(x: 200, y: 150, width: 400, height: 100)
        
        contentView.addSubview(label)
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
        
        return scrollView
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
}

struct NeuronUISegmentedControlDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: ["First", "Second", "Third"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }
    func updateUIView(_ uiView: UISegmentedControl, context: Context) {}
}

struct NeuronUISliderDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UISlider is unavailable on tvOS"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUIStepperDemo: UIViewRepresentable {
    //UIStepper' is unavailable in tvOS
    func makeUIView(context: Context) -> UILabel {
//        let stepper = UIStepper()
//        stepper.minimumValue = 0
//        stepper.maximumValue = 100
//        stepper.value = 50
//        stepper.stepValue = 1
//        return stepper
        let label = UILabel()
        label.text = "UIStepper is unavailable on tvOS"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUISwitchDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UISwitch is available on tvOS\nbut not commonly used"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct NeuronUITabBarControllerDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UITabBarController manages\ntab-based navigation interface"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}
