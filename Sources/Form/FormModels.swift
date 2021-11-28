//
//  FormModels.swift
//  GoGo
//
//  Created by Mathias Erligmann on 23/11/2020.
//

import UIKit
import CoreLocation
import MapKit
import AVFoundation


public enum FormModels {
    
    // MARK: Request
    
    struct Request {
        let formTitleLocalizedString: String
        let sections: [Section]
        let onFormClose: (() -> Void)?
        let formAction: FormAction
        let presentation: FormPresentation
    }
    
    // MARK: FormPresentation
    
    enum FormPresentation {
        case pushed
        case presented
    }
    
    // MARK: Form Action
    
    enum FormAction {
        case yes(FormActionRequirement)
        case no
    }
    
    struct FormActionRequirement {
        let onAction: ((FormViewController) -> Void)
        let actionButtonTitle: String
        let isActionButtonEnabled: Bool
    }
    
    // MARK: Form Structure
    
    // MARK: Entry Management
    
    // MARK: Basic
    
    // MARK: Text
    
    public struct TextEntry {
        let placeholder: String?
        let value: String?
        var action: (()-> Void)?
        var disclosure: Bool = false
    }
    
    // MARK: SecureTextInput
    
    public struct SecureTextInputEntry {
        let defaultText: String?
        let placeholder: String
        let onChange: (String?) -> Void
    }
    
    // MARK: RightButton
    
    public struct RightButtonEntry {
        let iconImage: String
        let title: String
        let onPress: (() -> Void)?
    }
    
    // MARK: SideButtonEntry
    
    public struct SideButtonEntry {
        let mode: SideButtonEntryMode
    }
    
    enum SideButtonEntryMode {
        case enabled(SideButtonEntryModeRequirement)
        case disabled(SideButtonEntryModeRequirement)
    }
    
    public struct SideButtonEntryModeRequirement {
        let description: String
        let buttonTitle: String
        let buttonAction: (() -> Void)?
    }
    
    // MARK: StateEntry
    
    public struct StateEntry {
        let placeholder: String
        let value: String
        let indicatorColor: UIColor
    }
    
    // MARK: Segment
    
    public struct SegmentEntry {
        let segments: [Segment]
        let onSegmentChange: (String) -> Void
        let isEnabled: Bool
    }
    
    struct Segment {
        let name: String
        let isSelected: Bool
    }
    
    // MARK: Switcher
    
    public struct SwitcherEntry {
        let title: String
        let backgroundColor: UIColor
        let imageColor: UIColor
        let imageName: BasicImage
        let isOn: Bool
        let onSwitchAction: ((Bool) -> Void)?
    }
    
    // MARK: Result
    
    public struct ResultEntry {
        let placeholder: String
        let image: BasicImage
        let disclosure: Bool
        let selected: Bool
        let action: (() -> Void)?
    }
    
    // MARK: PickerEntry
    
    public struct PickerEntry {
        let components: [Component]
        let onPick: (String) -> Void
    }
    
    struct Component {
        let rows: [ComponentRow]
    }
    
    struct ComponentRow {
        let title: String
    }
    
    // MARK: Post
    
    // MARK: Transaction
    
    public struct TransactionEntry {
        var action: (()-> Void)?
        var disclosure: Bool = false
    }
    
    // MARK: Image

    public struct ImageEntry {
        let image: UIImage?
        let url: URL?
        let height: Int
        let placeholder: String?
    }
    
    // MARK: Slider

    public struct SliderEntry {
        let onSliderChange: (Float, Bool, Bool) -> Void
        let initialValue: Float
        let minimum: Float
        let maximum: Float
    }
    
    // MARK: Stepper
    
    public struct StepperEntry {
        let minimum: Double
        let maximum: Double
        let number: Double
        let onStepper: (Double) -> Void
        var action: (()-> Void)?
        var disclosure: Bool = false
    }
    
    // MARK: Value
    
    public struct ValueEntry {
        let symbol: String
        let defaultText: String?
        let placeholder: String?
        let textColor: UIColor
        let editable: Bool
        let onChange: ((String?) -> Void)?
        var keyboardType: UIKeyboardType? = .decimalPad
    }
    
    // MARK: Camera
    
    public struct CameraEntry {
        let onCode: ((String) -> Void)
        let scan: AVMetadataObject.ObjectType
    }
    
    // MARK: Alert
    
    public struct AlertEntry {
        let color: UIColor
        let imageColor: UIColor
        let textColor: UIColor
        let alert : Alert
    }
    
    // MARK: TableView View Model
}
