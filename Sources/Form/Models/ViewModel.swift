//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/11/2021.
//

import UIKit

public class ViewModel {
    public var sections: [Section]
    
    public init(sections: [Section]) {
        self.sections = sections
    }
    
    // MARK: Interface
    
    public func getCell(at indexPath: IndexPath, for tableView: UITableView) -> UITableViewCell {
        let formType = sections[indexPath.section].entries[indexPath.row].entryType
        switch formType {
        case .basic(let basicEntry):
            return getBasicEntryCell(indexPath: indexPath,
                                     tableView: tableView,
                                     entry: basicEntry)
        case .text(let textEntry):
            return getTextEntryCell(indexPath: indexPath,
                                    tableView: tableView,
                                    entry: textEntry)
        case .textInput(let textInputEntry):
            return getTextInputEntryCell(indexPath: indexPath,
                                         tableView: tableView,
                                         entry: textInputEntry)
            
        case .secureTextInput(let secureTextInputEntry):
            return getSecureTextInputEntryCell(indexPath: indexPath,
                                               tableView: tableView,
                                               entry: secureTextInputEntry)
        case .segment(let segmentEntry):
            return getSegmentCell(indexPath: indexPath,
                                  tableView: tableView,
                                  entry: segmentEntry)
        case .basicButton(let basicButtonEntry):
            return getBasicButtonCell(indexPath: indexPath,
                                     tableView: tableView,
                                     entry: basicButtonEntry)
        case .rightButton(let rightButtonEntry):
            return getRightButtonCell(indexPath: indexPath,
                                      tableView: tableView,
                                      entry: rightButtonEntry)
        case .sideButton(let sideButtonEntry):
            return getSideButtonCell(indexPath: indexPath,
                                 tableView: tableView,
                                 entry: sideButtonEntry)
        case .state(let stateEntry):
            return getStateCell(indexPath: indexPath,
                                tableView: tableView,
                                entry: stateEntry)
        case .switcher(let switcherEntry):
            return getSwitcherEntryCell(indexPath: indexPath,
                                        tableView: tableView,
                                        entry: switcherEntry)
        case .result(let resultEntry):
            return getResultEntryCell(indexPath: indexPath,
                                      tableView: tableView,
                                      entry: resultEntry)
        case .dateAndTime(let dateAndTimeEntry):
            return getDateAndTimeCell(indexPath: indexPath,
                                      tableView: tableView,
                                      entry: dateAndTimeEntry)
        case .picker(let pickerEntry):
            return getPickerCell(indexPath: indexPath,
                                 tableView: tableView,
                                 entry: pickerEntry)
        case .transaction(let transactionEntry):
            return getTransactionCell(indexPath: indexPath,
                                      tableView: tableView,
                                      entry: transactionEntry)
        case .image(let imageEntry):
            return getImageCell(indexPath: indexPath,
                                tableView: tableView,
                                entry: imageEntry)
        case .slider(let sliderEntry):
            return getSliderCell(indexPath: indexPath,
                                 tableView: tableView,
                                 entry: sliderEntry)
        case .stepper(let stepperEntry):
            return getStepperCell(indexPath: indexPath,
                                  tableView: tableView,
                                  entry: stepperEntry)
        case .value(let valueEntry):
            return getValueCell(indexPath: indexPath,
                                tableView: tableView,
                                entry: valueEntry)
        case .map(let mapEntry):
            return getMapCell(indexPath: indexPath,
                              tableView: tableView,
                              entry: mapEntry)
        case .alert(let alertEntry):
            return getAlertCell(indexPath: indexPath,
                                tableView: tableView,
                                entry: alertEntry)
        case .camera(let cameraEntry):
            return getCameraCell(indexPath: indexPath,
                                 tableView: tableView,
                                 entry: cameraEntry)
        case .title(let titleEntry):
            return getTitleCell(indexPath: indexPath,
                                tableView: tableView,
                                entry: titleEntry)
        case .ranking(let rankingEntry):
            return getRankingCell(indexPath: indexPath,
                                  tableView: tableView,
                                  entry: rankingEntry)
        }
    }
    
    public func swap(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        let mover = sections[sourceIndexPath.section].entries.remove(at: sourceIndexPath.row)
        sections[destinationIndexPath.section].entries.insert(mover, at: destinationIndexPath.row)
    }
    
    public func getSectionTitle(for section: Int) -> String? {
        return sections[section].title
    }
    
    public func getRowHeight(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        let type = sections[indexPath.section].entries[indexPath.row].entryType
        switch type {
        case .image(let entry):
            return CGFloat(entry.height)
        case .map(let entry):
            switch entry.mode {
            case .get:
                return CGFloat(200)
            case .set(let zoom):
                if zoom {
                    return CGFloat(250)
                } else {
                    return CGFloat(200)
                }
            }
        case .camera:
            return CGFloat(300)
        default:
            return tableView.rowHeight
        }
    }
    
    public func canDeleteRow(at indexPath: IndexPath, tableView: UITableView) -> Bool {
        let type = sections[indexPath.section].entries[indexPath.row].entryType
        switch type {
        case .basic(let basicEntry):
            return basicEntry.supressable
        case .text(let textEntry):
            return textEntry.supressable
        default:
            return false
        }
    }
    
    public func onCellSelection(at indexPath: IndexPath, tableView: UITableView) {
        let type = sections[indexPath.section].entries[indexPath.row].entryType
        switch type {
        case .basic(let basicEntry):
            basicEntry.action?()
        case .result(let resultEntry):
            resultEntry.action?()
        case .text(let textEntry):
            textEntry.action?()
        case .picker(_):
            if let textCell = tableView.cellForRow(at: indexPath) as? PickerCell {
                textCell.onSelect()
            }
        case .transaction(let transactionEntry):
            transactionEntry.action?()
        case .alert(let alertEntry):
            alertEntry.alert.action?()
        default:
            break
        }
    }
    
    public func onCellLongSelection(at indexPath: IndexPath, tableView: UITableView) {
        let type = sections[indexPath.section].entries[indexPath.row].entryType
        switch type {
        case .text(_):
            if let textCell = tableView.cellForRow(at: indexPath) as? TextCell {
                textCell.onCopy()
            }
        default:
            break
        }
    }
    
    // MARK: Cell Management
    
    private func getBasicEntryCell(indexPath: IndexPath,
                                   tableView: UITableView,
                                   entry: BasicEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: BasicCell.cellIdentifier, for: indexPath) as? BasicCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getTextInputEntryCell(indexPath: IndexPath,
                                       tableView: UITableView,
                                       entry: TextInputEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: TextInputCell.cellIdentifier, for: indexPath) as? TextInputCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getSecureTextInputEntryCell(indexPath: IndexPath,
                                       tableView: UITableView,
                                             entry: FormModels.SecureTextInputEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: SecureInputCell.cellIdentifier, for: indexPath) as? SecureInputCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getTextEntryCell(indexPath: IndexPath,
                                  tableView: UITableView,
                                  entry: TextEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: TextCell.cellIdentifier, for: indexPath) as? TextCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getSegmentCell(indexPath: IndexPath,
                                tableView: UITableView,
                                entry: FormModels.SegmentEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: SegmentedCell.cellIdentifier, for: indexPath) as? SegmentedCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getBasicButtonCell(indexPath: IndexPath,
                                    tableView: UITableView,
                                    entry: BasicButtonEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: BasicButtonCell.cellIdentifier, for: indexPath) as? BasicButtonCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getRightButtonCell(indexPath: IndexPath,
                                    tableView: UITableView,
                                    entry: FormModels.RightButtonEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: RightButtonCell.cellIdentifier, for: indexPath) as? RightButtonCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getSideButtonCell(indexPath: IndexPath,
                                tableView: UITableView,
                                   entry: FormModels.SideButtonEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: SideButtonCell.cellIdentifier, for: indexPath) as? SideButtonCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getStateCell(indexPath: IndexPath,
                                tableView: UITableView,
                              entry: FormModels.StateEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: StateCell.cellIdentifier, for: indexPath) as? StateCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    func getSwitcherEntryCell(indexPath: IndexPath,
                           tableView: UITableView,
                              entry: FormModels.SwitcherEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: SwitcherCell.cellIdentifier, for: indexPath) as? SwitcherCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    func getResultEntryCell(indexPath: IndexPath,
                           tableView: UITableView,
                            entry: FormModels.ResultEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: ResultCell.cellIdentifier, for: indexPath) as? ResultCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    func getDateAndTimeCell(indexPath: IndexPath,
                            tableView: UITableView,
                            entry: DateAndTimeEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: DateAndTimeCell.cellIdentifier, for: indexPath) as? DateAndTimeCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    func getPickerCell(indexPath: IndexPath,
                       tableView: UITableView,
                       entry: FormModels.PickerEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: PickerCell.cellIdentifier, for: indexPath) as? PickerCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getTransactionCell(indexPath: IndexPath,
                                    tableView: UITableView,
                                    entry: FormModels.TransactionEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: TransactionCell.cellIdentifier, for: indexPath) as? TransactionCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getImageCell(indexPath: IndexPath,
                              tableView: UITableView,
                              entry: ImageEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: ImageCell.cellIdentifier, for: indexPath) as? ImageCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getSliderCell(indexPath: IndexPath,
                                tableView: UITableView,
                               entry: SliderEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: SliderCell.cellIdentifier, for: indexPath) as? SliderCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getStepperCell(indexPath: IndexPath,
                                tableView: UITableView,
                                entry: FormModels.StepperEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: StepperCell.cellIdentifier, for: indexPath) as? StepperCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getValueCell(indexPath: IndexPath,
                                tableView: UITableView,
                              entry: FormModels.ValueEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: ValueCell.cellIdentifier, for: indexPath) as? ValueCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getMapCell(indexPath: IndexPath,
                            tableView: UITableView,
                            entry: MapEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: MapCell.cellIdentifier, for: indexPath) as? MapCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getAlertCell(indexPath: IndexPath,
                            tableView: UITableView,
                              entry: FormModels.AlertEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: AlertCell.cellIdentifier, for: indexPath) as? AlertCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getCameraCell(indexPath: IndexPath,
                               tableView: UITableView,
                               entry: CameraEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: CameraCell.cellIdentifier, for: indexPath) as? CameraCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getTitleCell(indexPath: IndexPath,
                               tableView: UITableView,
                               entry: TitleEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: TitleCell.cellIdentifier, for: indexPath) as? TitleCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
    
    private func getRankingCell(indexPath: IndexPath,
                               tableView: UITableView,
                               entry: RankingEntry) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: RankingCell.cellIdentifier, for: indexPath) as? RankingCell {
            cell.set(entry: entry)
            return cell
        }
        return UITableViewCell()
    }
}
