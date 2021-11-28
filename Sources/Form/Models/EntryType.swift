//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 25/11/2021.
//

import Foundation

public enum EntryType {
    case basic(FormModels.BasicEntry)
    case text(FormModels.TextEntry)
    case textInput(FormModels.TextInputEntry)
    case secureTextInput(FormModels.SecureTextInputEntry)
    case basicButton(FormModels.BasicButtonEntry)
    case sideButton(FormModels.SideButtonEntry)
    case rightButton(FormModels.RightButtonEntry)
    case state(FormModels.StateEntry)
    case segment(FormModels.SegmentEntry)
    case switcher(FormModels.SwitcherEntry)
    case result(FormModels.ResultEntry)
    case dateAndTime(FormModels.DateAndTimeEntry)
    case picker(FormModels.PickerEntry)
    case transaction(FormModels.TransactionEntry)
    case image(FormModels.ImageEntry)
    case slider(FormModels.SliderEntry)
    case stepper(FormModels.StepperEntry)
    case value(FormModels.ValueEntry)
    case map(FormModels.MapEntry)
    case alert(FormModels.AlertEntry)
    case camera(FormModels.CameraEntry)
}
