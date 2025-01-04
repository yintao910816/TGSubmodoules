////
////  PresentationData.swift
////  BeWordsPresentationData
////
////  Created by apple on 2024/3/8.
////
//
//import UIKit
//import BeWordsUIPreferences
//import Components
//
//private func currentDateTimeFormat() -> PresentationDateTimeFormat {
//    let locale = Locale.current
//    let dateFormatter = DateFormatter()
//    dateFormatter.locale = locale
//    dateFormatter.dateStyle = .none
//    dateFormatter.timeStyle = .medium
//    dateFormatter.timeZone = TimeZone.current
//    let dateString = dateFormatter.string(from: Date())
//    
//    let timeFormat: PresentationTimeFormat
//    if dateString.contains(dateFormatter.amSymbol) || dateString.contains(dateFormatter.pmSymbol) {
//        timeFormat = .regular
//    } else {
//        timeFormat = .military
//    }
//    
//    let dateFormat: PresentationDateFormat
//    var dateSeparator = "/"
//    var dateSuffix = ""
//    var requiresFullYear = false
//    if let dateString = DateFormatter.dateFormat(fromTemplate: "MdY", options: 0, locale: locale) {
//        for separator in [". ", ".", "/", "-", "/"] {
//            if dateString.contains(separator) {
//                if separator == ". " {
//                    dateSuffix = "."
//                    dateSeparator = "."
//                    requiresFullYear = true
//                } else {
//                    dateSeparator = separator
//                }
//                break
//            }
//        }
//        if dateString.contains("M\(dateSeparator)d") {
//            dateFormat = .monthFirst
//        } else {
//            dateFormat = .dayFirst
//        }
//    } else {
//        dateFormat = .dayFirst
//    }
//
//    let decimalSeparator = locale.decimalSeparator ?? "."
//    let groupingSeparator = locale.groupingSeparator ?? ""
//    return PresentationDateTimeFormat(timeFormat: timeFormat, dateFormat: dateFormat, dateSeparator: dateSeparator, dateSuffix: dateSuffix, requiresFullYear: requiresFullYear, decimalSeparator: decimalSeparator, groupingSeparator: groupingSeparator)
//}
//
//public enum PresentationTimeFormat {
//    case regular
//    case military
//}
//
//public enum PresentationDateFormat {
//    case monthFirst
//    case dayFirst
//}
//
//public struct PresentationDateTimeFormat: Equatable {
//    public let timeFormat: PresentationTimeFormat
//    public let dateFormat: PresentationDateFormat
//    public let dateSeparator: String
//    public let dateSuffix: String
//    public let requiresFullYear: Bool
//    public let decimalSeparator: String
//    public let groupingSeparator: String
//    
//    public init() {
//        self.timeFormat = .regular
//        self.dateFormat = .monthFirst
//        self.dateSeparator = "."
//        self.dateSuffix = ""
//        self.requiresFullYear = false
//        self.decimalSeparator = "."
//        self.groupingSeparator = "."
//    }
//    
//    public init(timeFormat: PresentationTimeFormat, dateFormat: PresentationDateFormat, dateSeparator: String, dateSuffix: String, requiresFullYear: Bool, decimalSeparator: String, groupingSeparator: String) {
//        self.timeFormat = timeFormat
//        self.dateFormat = dateFormat
//        self.dateSeparator = dateSeparator
//        self.dateSuffix = dateSuffix
//        self.requiresFullYear = requiresFullYear
//        self.decimalSeparator = decimalSeparator
//        self.groupingSeparator = groupingSeparator
//    }
//}
//
//public struct PresentationChatBubbleCorners: Equatable, Hashable {
//    public var mainRadius: CGFloat
//    public var auxiliaryRadius: CGFloat
//    public var mergeBubbleCorners: Bool
//    
//    public init(mainRadius: CGFloat, auxiliaryRadius: CGFloat, mergeBubbleCorners: Bool) {
//        self.mainRadius = mainRadius
//        self.auxiliaryRadius = auxiliaryRadius
//        self.mergeBubbleCorners = mergeBubbleCorners
//    }
//}
//
//private func resolveFontSize(settings: PresentationThemeSettings) -> (chat: PresentationFontSize, lists: PresentationFontSize) {
//    let fontSize: PresentationFontSize
//    let listsFontSize: PresentationFontSize
//    if settings.useSystemFont {
//        let pointSize = UIFont.preferredFont(forTextStyle: .body).pointSize
//        fontSize = PresentationFontSize(systemFontSize: pointSize)
//        listsFontSize = fontSize
//    } else {
//        fontSize = settings.fontSize
//        listsFontSize = settings.listsFontSize
//    }
//    return (fontSize, listsFontSize)
//}
//
//public func setupTheme(_ themeName: PresentationThemeName) ->PresentationTheme {
//    let theme: PresentationTheme
//    switch themeName {
//    case let .system(type):
//        theme = type == .dark ? makeDefaultSystemDarkPresentationTheme() : makeDefaultSystemLightPresentationTheme()
//    case let .custom(name):
//        switch name {
//        case .day:
//            theme = makeDefaultDayPresentationTheme()
//        case .dark:
//            theme = makeDefaultDarkPresentationTheme()
//        case .blureBlue:
//            theme = makeDefaultDayPresentationTheme()
//        case .blurePink:
//            theme = makeDefaultBlurePinkPresentationTheme()
//        case .blureGreen:
//            theme = makeDefaultBlureGreenPresentationTheme()
//        case .blurePurple:
//            theme = makeDefaultBlurePurplePresentationTheme()
//        }
//    }
//    return theme
//}
//
//public func defaultPresentationData(themeName: PresentationThemeName) -> PresentationData {
//    let dateTimeFormat = currentDateTimeFormat()
//    let nameDisplayOrder: PresentationPersonNameOrder = .firstLast
//    
//    let themeSettings = PresentationThemeSettings.defaultSettings
//    
//    let (chatFontSize, listsFontSize) = resolveFontSize(settings: themeSettings)
//    
//    let chatBubbleCorners = PresentationChatBubbleCorners(mainRadius: CGFloat(themeSettings.chatBubbleSettings.mainRadius), auxiliaryRadius: CGFloat(themeSettings.chatBubbleSettings.auxiliaryRadius), mergeBubbleCorners: themeSettings.chatBubbleSettings.mergeBubbleCorners)
//    
//    
//    return PresentationData(
//        theme: setupTheme(themeName),
//        listsFontSize: listsFontSize,
//        chatFontSize: chatFontSize,
//        dateTimeFormat: dateTimeFormat,
//        nameDisplayOrder: nameDisplayOrder,
//        chatBubbleCorners: chatBubbleCorners,
//        strings: ComponentsGlobals.provider() as! ComponentsGlobalsProvider
//    )
//}
//
//public final class PresentationData: Equatable {
//    public let theme: PresentationTheme
//    public let listsFontSize: PresentationFontSize
//    
//    public let chatFontSize: PresentationFontSize
//    public let dateTimeFormat: PresentationDateTimeFormat
//    public let nameDisplayOrder: PresentationPersonNameOrder
//    public let chatBubbleCorners: PresentationChatBubbleCorners
//    
//    public let strings: ComponentsGlobalsProvider
//
//    init(theme: PresentationTheme, listsFontSize: PresentationFontSize, chatFontSize: PresentationFontSize, dateTimeFormat: PresentationDateTimeFormat, nameDisplayOrder: PresentationPersonNameOrder, chatBubbleCorners: PresentationChatBubbleCorners, strings: ComponentsGlobalsProvider) {
//        self.theme = theme
//        self.listsFontSize = listsFontSize
//        self.chatFontSize = chatFontSize
//        self.dateTimeFormat = dateTimeFormat
//        self.nameDisplayOrder = nameDisplayOrder
//        self.chatBubbleCorners = chatBubbleCorners
//        self.strings = strings
//    }
//        
//    public func withUpdated(theme: PresentationTheme) -> PresentationData {
//        return PresentationData(theme: theme, listsFontSize: self.listsFontSize, chatFontSize: self.chatFontSize, dateTimeFormat: self.dateTimeFormat, nameDisplayOrder: self.nameDisplayOrder, chatBubbleCorners: self.chatBubbleCorners, strings: self.strings)
//    }
//        
//    public static func ==(lhs: PresentationData, rhs: PresentationData) -> Bool {
//        return lhs.theme === rhs.theme && lhs.listsFontSize == rhs.listsFontSize
//    }
//}
//
//public final class InitialPresentationDataAndSettings {
//    public let presentationData: PresentationData
//    
//    public init(presentationData: PresentationData) {
//        self.presentationData = presentationData
//    }
//}

public class TestB {
    
    public static func printTest() {
        print("测试")
    }
}
