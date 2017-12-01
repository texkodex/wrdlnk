//
//  AppTheme.swift
//  wrdlnk
//
//  Created by sparkle on 8/18/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//
import UIKit
import SpriteKit

// MARK:- Begginning of color definition

// color group one
let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
let midgroundColor = #colorLiteral(red: 0.968627451, green: 0.8666666667, blue: 0.862745098, alpha: 1)
let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
let markBackgroundColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)

// MARK:- Color Group One
protocol ColorInfo {
    var name: String { get }
}

struct ColorGroupOneLoginScene: ColorInfo {
    let name = "ColorGroupOneLoginScene"
    let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let errorFill = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let errorStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let errorTextFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let errorTextStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let markfillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.7214989066, green: 0.7216190696, blue: 0.7214733958, alpha: 1)
    let passswordFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let passwordStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let passswordDotFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let passwordDotStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let emailFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let emailStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let separatorFill = #colorLiteral(red: 0.9529411765, green: 0.7333333333, blue: 0.7294117647, alpha: 1)
    let separatorStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let footerFillColor = #colorLiteral(red: 0.968627451, green: 0.8666666667, blue: 0.862745098, alpha: 1)
    let footerStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let googleFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let googleStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
}

let colorGroupOneLoginScene = ColorGroupOneLoginScene()

struct ColorGroupOneGameScene: ColorInfo {
    let name = "ColorGroupOneGameScene"
    let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let markFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let tileBoardFill = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let tileBoardStroke = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let tileButtonFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let tileButtonStroke = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
}

let colorGroupOneGameScene = ColorGroupOneGameScene()

struct ColorGroupOneNewgameScene: ColorInfo {
    let name = "ColorGroupOneNewgameScene"
    let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let markFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let textFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let textStroke = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let noFill = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let noStroke = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
}

let colorGroupOneNewgameScene = ColorGroupOneNewgameScene()

struct ColorGroupOneSettingScene: ColorInfo {
    let name = "ColorGroupOneSettingScene"
    let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let markFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let titleFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
}

let colorGroupOneSettingScene = ColorGroupOneSettingScene()

struct ColorGroupOneAwardScene: ColorInfo {
    let name = "ColorGroupOneAwardScene"
    let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let markFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let shareFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let shareStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
    let awardGoldFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let awardGoldStrokeColor = #colorLiteral(red: 1, green: 0.9137254902, blue: 0, alpha: 1)
    let awardSilverFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let awardSilverStrokeColor = #colorLiteral(red: 0.7529411765, green: 0.7529411765, blue: 0.7529411765, alpha: 1)
    let awardBronzeFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let awardBronzeStrokeColor = #colorLiteral(red: 0.8039215686, green: 0.4980392157, blue: 0.1960784314, alpha: 1)
}

let colorGroupOneAwardScene = ColorGroupOneAwardScene()

struct ColorGroupOneGraphScene: ColorInfo {
    let name = "ColorGroupOneGraphScene"
    let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let titleFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let graphFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let graphStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let positionIconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let positionIconStrokeColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
}

let colorGroupOneGraphScene = ColorGroupOneGraphScene()

struct ColorGroupOneInstructionScene: ColorInfo {
    let name = "ColorGroupOneInstructionScene"
    let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
    let markFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let textFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let textStroke = #colorLiteral(red: 0.9977614284, green: 0.7539606094, blue: 0.7520661354, alpha: 1)
    let dotFill = #colorLiteral(red: 0.9946164489, green: 0.6791595817, blue: 0.6756042838, alpha: 1)
    let dotStroke = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998704791, alpha: 0)
    let dotSelectionFill = #colorLiteral(red: 1, green: 0.4459821582, blue: 0.4517608881, alpha: 1)
    let dotSelectionStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.9977614284, green: 0.7539606094, blue: 0.7520661354, alpha: 1)
}

let colorGroupOneInstructionScene = ColorGroupOneInstructionScene()

// MARK:- Color Group Two
struct ColorGroupTwoLoginScene: ColorInfo {
    let name = "ColorGroupTwoLoginScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let errorFill = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let errorStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let tileButtonFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let tileButtonStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let passswordFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let passwordStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let emailFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let emailStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let separatorFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1983625856)
    let separatorStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let footerFillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3010220462)
    let footerStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let googleFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    let googleStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
}

let colorGroupTwoLoginScene = ColorGroupTwoLoginScene()

struct ColorGroupTwoGameScene: ColorInfo {
    let name = "ColorGroupTwoGameScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let tileBoardFill = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let tileBoardStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let tileButtonFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let tileButtonStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markfillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3903039384)
}

let colorGroupTwoGameScene = ColorGroupTwoGameScene()

struct ColorGroupTwoNewgameScene: ColorInfo {
    let name = "ColorGroupTwoNewgameScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let textFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let textStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let noFill = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let noStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
}

let colorGroupTwoNewgameScene = ColorGroupTwoNewgameScene()

struct ColorGroupTwoSettingScene: ColorInfo {
    let name = "ColorGroupTwoSettingScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
}

let colorGroupTwoSettingScene = ColorGroupTwoSettingScene()

struct ColorGroupTwoAwardScene: ColorInfo {
    let name = "ColorGroupTwoAwardScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let shareFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let shareStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
    let awardGoldFillColor = #colorLiteral(red: 1, green: 0.9137254902, blue: 0, alpha: 1)
    let awardGoldStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let awardSilverFillColor = #colorLiteral(red: 0.7529411765, green: 0.7529411765, blue: 0.7529411765, alpha: 1)
    let awardSilverStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let awardBronzeFillColor = #colorLiteral(red: 0.8039215686, green: 0.4980392157, blue: 0.1960784314, alpha: 1)
    let awardBronzeStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
}

let colorGroupTwoAwardScene = ColorGroupTwoAwardScene()

struct ColorGroupTwoGraphScene: ColorInfo {
    let name = "ColorGroupTwoGraphScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
}

let colorGroupTwoGraphScene = ColorGroupTwoGraphScene()

struct ColorGroupTwoInstructionScene: ColorInfo {
    let name = "ColorGroupTwoInstructionScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markfillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let textFill = #colorLiteral(red: 0.8431372549, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let textStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let dotFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1957673373)
    let dotStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let dotSelectionFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    let dotSelectionStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
}

let colorGroupTwoInstructionScene = ColorGroupTwoInstructionScene()

// MARK:- Color Group Three
struct ColorGroupThreeLoginScene: ColorInfo {
    let name = "ColorGroupThreeLoginScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markfillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let errorFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let errorStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let tileButtonFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let tileButtonStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let passswordFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let passwordStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let emailFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let emailStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let separatorFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1983625856)
    let separatorStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let footerFillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3010220462)
    let footerStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let googleFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    let googleStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
}

let colorGroupThreeLoginScene = ColorGroupThreeLoginScene()

struct ColorGroupThreeGameScene: ColorInfo {
    let name = "ColorGroupThreeGameScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let tileBoardFill = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let tileBoardStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let tileButtonFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let tileButtonStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markfillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3903039384)
}

let colorGroupThreeGameScene = ColorGroupThreeGameScene()

struct ColorGroupThreeNewgameScene: ColorInfo {
    let name = "ColorGroupThreeNewgameScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let textFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let textStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let noFill = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let noStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
}

let colorGroupThreeNewgameScene = ColorGroupThreeNewgameScene()

struct ColorGroupThreeSettingScene: ColorInfo {
    let name = "ColorGroupThreeSettingScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
}

let colorGroupThreeSettingScene = ColorGroupThreeSettingScene()

struct ColorGroupThreeAwardScene: ColorInfo {
    let name = "ColorGroupThreeAwardScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let shareFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let shareStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
    let awardGoldFillColor = #colorLiteral(red: 1, green: 0.9137254902, blue: 0, alpha: 1)
    let awardGoldStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let awardSilverFillColor = #colorLiteral(red: 0.7529411765, green: 0.7529411765, blue: 0.7529411765, alpha: 1)
    let awardSilverStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let awardBronzeFillColor = #colorLiteral(red: 0.8039215686, green: 0.4980392157, blue: 0.1960784314, alpha: 1)
    let awardBronzeStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
}

let colorGroupThreeAwardScene = ColorGroupThreeAwardScene()

struct ColorGroupThreeGraphScene: ColorInfo {
    let name = "ColorGroupThreeGraphScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
}

let colorGroupThreeGraphScene = ColorGroupThreeGraphScene()

struct ColorGroupThreeInstructionScene: ColorInfo {
    let name = "ColorGroupThreeInstructionScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markfillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let textFill = #colorLiteral(red: 0.8431372549, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let textStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let dotFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1957673373)
    let dotStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let dotSelectionFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    let dotSelectionStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
}

let colorGroupThreeInstructionScene = ColorGroupThreeInstructionScene()

// MARK:- Color Group Four
struct ColorGroupFourLoginScene: ColorInfo {
    let name = "ColorGroupFourLoginScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let errorFill = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let errorStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let tileButtonFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let tileButtonStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let passswordFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let passwordStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let emailFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let emailStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let separatorFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1983625856)
    let separatorStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let footerFillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3010220462)
    let footerStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let googleFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    let googleStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
}

let colorGroupFourLoginScene = ColorGroupFourLoginScene()

struct ColorGroupFourGameScene: ColorInfo {
    let name = "ColorGroupFourGameScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let tileBoardFill = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let tileBoardStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let tileButtonFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let tileButtonStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markfillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3903039384)
}

let colorGroupFourGameScene = ColorGroupFourGameScene()

struct ColorGroupFourNewgameScene: ColorInfo {
    let name = "ColorGroupFourNewgameScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let markBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let textFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let textStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let noFill = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
    let noStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
}

let colorGroupFourNewgameScene = ColorGroupFourNewgameScene()

struct ColorGroupFourSettingScene: ColorInfo {
    let name = "ColorGroupFourSettingScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
}

let colorGroupFourSettingScene = ColorGroupFourSettingScene()

struct ColorGroupFourAwardScene: ColorInfo {
    let name = "ColorGroupFourAwardScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let shareFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let shareStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
    let awardGoldFillColor = #colorLiteral(red: 1, green: 0.9137254902, blue: 0, alpha: 1)
    let awardGoldStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let awardSilverFillColor = #colorLiteral(red: 0.7529411765, green: 0.7529411765, blue: 0.7529411765, alpha: 1)
    let awardSilverStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let awardBronzeFillColor = #colorLiteral(red: 0.8039215686, green: 0.4980392157, blue: 0.1960784314, alpha: 1)
    let awardBronzeStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
}

let colorGroupFourAwardScene = ColorGroupFourAwardScene()

struct ColorGroupFourGraphScene: ColorInfo {
    let name = "ColorGroupFourGraphScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let baseFill = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
    let baseStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let labelFillColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 0.7013859161)
    let labelStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let iconFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let iconStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
    let exitIconColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let exitIconStrokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4010595034)
}

let colorGroupFourGraphScene = ColorGroupFourGraphScene()

struct ColorGroupFourInstructionScene: ColorInfo {
    let name = "ColorGroupFourInstructionScene"
    let backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
    let markfillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let markStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let titleFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let titleStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let textFill = #colorLiteral(red: 0.8431372549, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    let textStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let dotFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1957673373)
    let dotStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let dotSelectionFill = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    let dotSelectionStroke = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    let yesFill = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
    let yesStroke = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
}

let colorGroupFourInstructionScene = ColorGroupFourInstructionScene()

// MARK:- Walkthrough themes
let colorListGroupInstructionView = [ colorGroupOneInstructionScene,
                                   colorGroupTwoInstructionScene,
                                   colorGroupThreeInstructionScene,
                                   colorGroupFourInstructionScene ] as [Any]

// MARK:- End Walkthrough theme

enum ColorGroupIndex: Int {
    case loginScene = 0
    case gameScene = 1
    case newgameScene = 2
    case settingScene = 3
    case awardScene = 4
    case graphScene = 5
    case instructionScene = 6
    
    static let types = [loginScene, gameScene,
                        newgameScene, settingScene,
                        awardScene, graphScene,
                        instructionScene]
}


let colorListGroupOne = [colorGroupOneLoginScene, colorGroupOneGameScene, colorGroupOneNewgameScene, colorGroupOneSettingScene,
    colorGroupOneAwardScene, colorGroupOneGraphScene,
    colorGroupOneInstructionScene] as [Any]

let colorListGroupTwo = [colorGroupTwoLoginScene, colorGroupTwoGameScene, colorGroupTwoNewgameScene, colorGroupTwoSettingScene,
    colorGroupTwoAwardScene, colorGroupTwoGraphScene,
    colorGroupTwoInstructionScene] as [Any]

let colorListGroupThree = [colorGroupThreeLoginScene, colorGroupThreeGameScene, colorGroupThreeNewgameScene, colorGroupThreeSettingScene,
                         colorGroupThreeAwardScene, colorGroupThreeGraphScene,
                         colorGroupThreeInstructionScene] as [Any]

let colorListGroupFour = [colorGroupFourLoginScene, colorGroupFourGameScene, colorGroupFourNewgameScene, colorGroupFourSettingScene,
                         colorGroupFourAwardScene, colorGroupFourGraphScene,
                         colorGroupFourInstructionScene] as [Any]

// MARK:- End of color definition

enum Mode: String {
    case nightMode = "night"
    case pastel = "pastel"
    case colorBlind = "colorBlind"
    case normal = "normal"
}

func currentMode() -> Mode {
    let nightMode = AppDefinition.defaults.bool(forKey: preferenceNightModeEnabledKey)
    let pastel = AppDefinition.defaults.bool(forKey: preferencePastelEnabledKey)
    let colorBlind = AppDefinition.defaults.bool(forKey: preferenceColorBlindEnabledKey)
    if colorBlind { return Mode.colorBlind }
    if nightMode { return Mode.nightMode }
    if pastel { return Mode.pastel }
    return Mode.normal
}

class AppTheme {
    static let instance = AppTheme()
    
    let modeCondition = (currentMode() == Mode.pastel || currentMode() == Mode.nightMode || currentMode() == Mode.colorBlind)
    
    let modeNormal = currentMode() == Mode.normal
    let modePastel = currentMode() == Mode.pastel
    let modeNightMode = currentMode() == Mode.nightMode
    let modeColorBlind = currentMode() == Mode.colorBlind
    
    enum ModeIndex: Int {
        case normal = 0
        case pastel = 1
        case nightMode = 2
        case colorBlind = 3
        
        static let types = [normal, pastel, nightMode, colorBlind]
    }
    
    func returnColorGroup(name: String?) -> Any? {
        for (_ , colorSetMember) in [colorListGroupOne + colorListGroupTwo + colorListGroupThree + colorListGroupFour].enumerated() {
            for (index, colorGroup) in colorSetMember.enumerated() {
                let itemType = String(describing: type(of: colorGroup))
                if itemType == name {
                    print("index: \(index) for itemType: \(itemType) match name: \((name)!)")
                    return colorGroup
                }
            }
        }
        return nil
    }
    
    func returnColorGroupByName(sceneName: String) -> (colorgroup: Any?, colorgroupName: String?) {
        if sceneName.contains("Scene")
            && (!sceneName.contains("ColorGroupOne")
                && !sceneName.contains("ColorGroupTwo")
                && !sceneName.contains("ColorGroupThree")
                && !sceneName.contains("ColorGroupFour")) {
            switch currentMode() {
            case Mode.colorBlind:
                let colorgroupName = "ColorGroupFour" + sceneName
                return (returnColorGroup(name: colorgroupName), colorgroupName)
            case Mode.nightMode:
                let colorgroupName = "ColorGroupThree" + sceneName
                return (returnColorGroup(name: colorgroupName), colorgroupName)
            case Mode.pastel:
                let colorgroupName = "ColorGroupTwo" + sceneName
                return (returnColorGroup(name: colorgroupName), colorgroupName)
            case Mode.normal:
                let colorgroupName = "ColorGroupOne" + sceneName
                return (returnColorGroup(name: colorgroupName), colorgroupName)
            }
        }
        return (nil, nil)
    }
    
    func set(for controller: UIViewController?, viewType: String = "InstructionScene") {
        guard let controller = controller else { return }
        let viewScene = viewType.replacingOccurrences(of: "View", with: "Scene")
        let colorgroup = returnColorGroupByName(sceneName: viewScene)
        
        switch colorgroup.colorgroup {
        case let InstructionView as ColorGroupOneInstructionScene:
            if viewType == viewScene {
                let viewNode = controller as! WalkThroughOneViewController
                viewNode.backgroundView.backgroundColor = InstructionView.backgroundColor
            }
            break
        case let InstructionView as ColorGroupTwoInstructionScene:
            if viewType == viewScene {
                let viewNode = controller as! WalkThroughOneViewController
                viewNode.backgroundView.backgroundColor = InstructionView.backgroundColor
            }
            break
        case let InstructionView as ColorGroupThreeInstructionScene:
            if viewType == viewScene {
                let viewNode = controller as! WalkThroughOneViewController
                viewNode.backgroundView.backgroundColor = InstructionView.backgroundColor
            }
            break
        case let InstructionView as ColorGroupFourInstructionScene:
            if viewType == viewScene {
                let viewNode = controller as! WalkThroughOneViewController
                viewNode.backgroundView.backgroundColor = InstructionView.backgroundColor
            }
            break
        default:
            print("No colorgroup returned for InstructionView")
            break
        }
    }
    
    func set(for view: SKNode, sceneType: String = "SettingScene") {
        let colorgroup = returnColorGroupByName(sceneName: sceneType)
        
        switch colorgroup.colorgroup {
        case let SettingScene as ColorGroupOneSettingScene:
            if view.name == "SettingOverlayNode" {
                let viewNode = view as! SettingOverlay
                viewNode.backgroundBase.fillColor = SettingScene.backgroundColor
                viewNode.titleLabel.fontColor = SettingScene.titleFill
                viewNode.titleLabel.colorBlendFactor = 1
                viewNode.base.fillColor = SettingScene.baseFill
                viewNode.base.strokeColor = SettingScene.baseStroke
                viewNode.sound.fontColor = SettingScene.labelStrokeColor
                viewNode.soundButton.color = SettingScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.soundButton.color = SettingScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.score.fontColor = SettingScene.labelStrokeColor
                viewNode.scoreButton.color = SettingScene.iconStrokeColor
                viewNode.scoreButton.colorBlendFactor = 1
                viewNode.timer.fontColor = SettingScene.labelStrokeColor
                viewNode.timerButton.color = SettingScene.iconStrokeColor
                viewNode.timerButton.colorBlendFactor = 1
                viewNode.nightMode.fontColor = SettingScene.labelStrokeColor
                viewNode.nightModeButton.color = SettingScene.iconStrokeColor
                viewNode.nightModeButton.colorBlendFactor = 1
                viewNode.pastel.fontColor = SettingScene.labelStrokeColor
                viewNode.pastelButton.color = SettingScene.iconStrokeColor
                viewNode.pastelButton.colorBlendFactor = 1
                viewNode.colorBlind.fontColor = SettingScene.labelStrokeColor
                viewNode.colorBlindButton.color = SettingScene.iconStrokeColor
                viewNode.colorBlindButton.colorBlendFactor = 1
                viewNode.signup.fontColor = SettingScene.labelStrokeColor
                viewNode.signupButton.color = SettingScene.iconStrokeColor
                viewNode.signupButton.colorBlendFactor = 1
                viewNode.dismissOverlay.color = SettingScene.exitIconStrokeColor
                viewNode.dismissOverlay.colorBlendFactor = 1
            } else if view.name == "GraphOverlayNode" {
                let viewNode = view as! GraphOverlay
                viewNode.backgroundBase.fillColor = SettingScene.backgroundColor
                viewNode.titleLabel.fontColor = SettingScene.titleFill
                viewNode.titleLabel.colorBlendFactor = 1
                viewNode.base.fillColor = SettingScene.baseFill
                viewNode.base.strokeColor = SettingScene.baseStroke
                viewNode.hundred.fontColor = SettingScene.labelStrokeColor
                viewNode.hundred.colorBlendFactor = 1
                viewNode.zero.fontColor = SettingScene.labelStrokeColor
                viewNode.zero.colorBlendFactor = 1
                viewNode.dismissOverlay.color = SettingScene.exitIconStrokeColor
                viewNode.dismissOverlay.colorBlendFactor = 1
            }
            break
        case let SettingScene as ColorGroupTwoSettingScene:
            if view.name == "SettingOverlayNode" {
                let viewNode = view as! SettingOverlay
                viewNode.backgroundBase.fillColor = SettingScene.backgroundColor
                viewNode.titleLabel.fontColor = SettingScene.titleFill
                viewNode.titleLabel.colorBlendFactor = 1
                viewNode.base.fillColor = SettingScene.baseFill
                viewNode.base.strokeColor = SettingScene.baseStroke
                viewNode.sound.fontColor = SettingScene.labelStrokeColor
                viewNode.soundButton.color = SettingScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.soundButton.color = SettingScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.score.fontColor = SettingScene.labelStrokeColor
                viewNode.scoreButton.color = SettingScene.iconStrokeColor
                viewNode.scoreButton.colorBlendFactor = 1
                viewNode.timer.fontColor = SettingScene.labelStrokeColor
                viewNode.timerButton.color = SettingScene.iconStrokeColor
                viewNode.timerButton.colorBlendFactor = 1
                viewNode.nightMode.fontColor = SettingScene.labelStrokeColor
                viewNode.nightModeButton.color = SettingScene.iconStrokeColor
                viewNode.nightModeButton.colorBlendFactor = 1
                viewNode.pastel.fontColor = SettingScene.labelStrokeColor
                viewNode.pastelButton.color = SettingScene.iconStrokeColor
                viewNode.pastelButton.colorBlendFactor = 1
                viewNode.colorBlind.fontColor = SettingScene.labelStrokeColor
                viewNode.colorBlindButton.color = SettingScene.iconStrokeColor
                viewNode.colorBlindButton.colorBlendFactor = 1
                viewNode.signup.fontColor = SettingScene.labelStrokeColor
                viewNode.signupButton.color = SettingScene.iconStrokeColor
                viewNode.signupButton.colorBlendFactor = 1
                viewNode.dismissOverlay.color = SettingScene.exitIconStrokeColor
                viewNode.dismissOverlay.colorBlendFactor = 1
            } else if view.name == "GraphOverlayNode" {
                let viewNode = view as! GraphOverlay
                viewNode.backgroundBase.fillColor = SettingScene.backgroundColor
                viewNode.titleLabel.fontColor = SettingScene.titleFill
                viewNode.titleLabel.colorBlendFactor = 1
                viewNode.base.fillColor = SettingScene.baseFill
                viewNode.base.strokeColor = SettingScene.baseStroke
                viewNode.hundred.fontColor = SettingScene.labelStrokeColor
                viewNode.hundred.colorBlendFactor = 1
                viewNode.zero.fontColor = SettingScene.labelStrokeColor
                viewNode.zero.colorBlendFactor = 1
                viewNode.dismissOverlay.color = SettingScene.exitIconStrokeColor
                viewNode.dismissOverlay.colorBlendFactor = 1
            }
            break
        case let SettingScene as ColorGroupThreeSettingScene:
            if view.name == "SettingOverlayNode" {
                let viewNode = view as! SettingOverlay
                viewNode.backgroundBase.fillColor = SettingScene.backgroundColor
                viewNode.titleLabel.fontColor = SettingScene.titleFill
                viewNode.titleLabel.colorBlendFactor = 1
                viewNode.base.fillColor = SettingScene.baseFill
                viewNode.base.strokeColor = SettingScene.baseStroke
                viewNode.sound.fontColor = SettingScene.labelStrokeColor
                viewNode.soundButton.color = SettingScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.soundButton.color = SettingScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.score.fontColor = SettingScene.labelStrokeColor
                viewNode.scoreButton.color = SettingScene.iconStrokeColor
                viewNode.scoreButton.colorBlendFactor = 1
                viewNode.timer.fontColor = SettingScene.labelStrokeColor
                viewNode.timerButton.color = SettingScene.iconStrokeColor
                viewNode.timerButton.colorBlendFactor = 1
                viewNode.nightMode.fontColor = SettingScene.labelStrokeColor
                viewNode.nightModeButton.color = SettingScene.iconStrokeColor
                viewNode.nightModeButton.colorBlendFactor = 1
                viewNode.pastel.fontColor = SettingScene.labelStrokeColor
                viewNode.pastelButton.color = SettingScene.iconStrokeColor
                viewNode.pastelButton.colorBlendFactor = 1
                viewNode.colorBlind.fontColor = SettingScene.labelStrokeColor
                viewNode.colorBlindButton.color = SettingScene.iconStrokeColor
                viewNode.colorBlindButton.colorBlendFactor = 1
                viewNode.signup.fontColor = SettingScene.labelStrokeColor
                viewNode.signupButton.color = SettingScene.iconStrokeColor
                viewNode.signupButton.colorBlendFactor = 1
                viewNode.dismissOverlay.color = SettingScene.exitIconStrokeColor
                viewNode.dismissOverlay.colorBlendFactor = 1
            } else if view.name == "GraphOverlayNode" {
                let viewNode = view as! GraphOverlay
                viewNode.backgroundBase.fillColor = SettingScene.backgroundColor
                viewNode.titleLabel.fontColor = SettingScene.titleFill
                viewNode.titleLabel.colorBlendFactor = 1
                viewNode.base.fillColor = SettingScene.baseFill
                viewNode.base.strokeColor = SettingScene.baseStroke
                viewNode.hundred.fontColor = SettingScene.labelStrokeColor
                viewNode.hundred.colorBlendFactor = 1
                viewNode.zero.fontColor = SettingScene.labelStrokeColor
                viewNode.zero.colorBlendFactor = 1
                viewNode.dismissOverlay.color = SettingScene.exitIconStrokeColor
                viewNode.dismissOverlay.colorBlendFactor = 1
            }
            break
        case let SettingScene as ColorGroupFourSettingScene:
            if view.name == "SettingOverlayNode" {
                let viewNode = view as! SettingOverlay
                viewNode.backgroundBase.fillColor = SettingScene.backgroundColor
                viewNode.titleLabel.fontColor = SettingScene.titleFill
                viewNode.titleLabel.colorBlendFactor = 1
                viewNode.base.fillColor = SettingScene.baseFill
                viewNode.base.strokeColor = SettingScene.baseStroke
                viewNode.sound.fontColor = SettingScene.labelStrokeColor
                viewNode.soundButton.color = SettingScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.soundButton.color = SettingScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.score.fontColor = SettingScene.labelStrokeColor
                viewNode.scoreButton.color = SettingScene.iconStrokeColor
                viewNode.scoreButton.colorBlendFactor = 1
                viewNode.timer.fontColor = SettingScene.labelStrokeColor
                viewNode.timerButton.color = SettingScene.iconStrokeColor
                viewNode.timerButton.colorBlendFactor = 1
                viewNode.nightMode.fontColor = SettingScene.labelStrokeColor
                viewNode.nightModeButton.color = SettingScene.iconStrokeColor
                viewNode.nightModeButton.colorBlendFactor = 1
                viewNode.pastel.fontColor = SettingScene.labelStrokeColor
                viewNode.pastelButton.color = SettingScene.iconStrokeColor
                viewNode.pastelButton.colorBlendFactor = 1
                viewNode.colorBlind.fontColor = SettingScene.labelStrokeColor
                viewNode.colorBlindButton.color = SettingScene.iconStrokeColor
                viewNode.colorBlindButton.colorBlendFactor = 1
                viewNode.signup.fontColor = SettingScene.labelStrokeColor
                viewNode.signupButton.color = SettingScene.iconStrokeColor
                viewNode.signupButton.colorBlendFactor = 1
                viewNode.dismissOverlay.color = SettingScene.exitIconStrokeColor
                viewNode.dismissOverlay.colorBlendFactor = 1
            } else if view.name == "GraphOverlayNode" {
                let viewNode = view as! GraphOverlay
                viewNode.backgroundBase.fillColor = SettingScene.backgroundColor
                viewNode.titleLabel.fontColor = SettingScene.titleFill
                viewNode.titleLabel.colorBlendFactor = 1
                viewNode.base.fillColor = SettingScene.baseFill
                viewNode.base.strokeColor = SettingScene.baseStroke
                viewNode.hundred.fontColor = SettingScene.labelStrokeColor
                viewNode.hundred.colorBlendFactor = 1
                viewNode.zero.fontColor = SettingScene.labelStrokeColor
                viewNode.zero.colorBlendFactor = 1
                viewNode.dismissOverlay.color = SettingScene.exitIconStrokeColor
                viewNode.dismissOverlay.colorBlendFactor = 1
            }
            
            break
        default:
            print("No overlay theme selected for \(String(describing: view.name))")
            break
        }
    }
    
    func set(for view: BaseScene, sceneType: String = "SettingScene") {

        let colorgroupPair = returnColorGroupByName(sceneName: sceneType)
        
        switch colorgroupPair.colorgroup {
        case let LoginScene as ColorGroupOneLoginScene:
            view.backgroundColor = LoginScene.backgroundColor
            break
        case let SettingOneScene as ColorGroupOneSettingScene:
            if view.name == "MainMenuScene" {
                let viewNode = view as! MainMenuScene
                view.backgroundColor = SettingOneScene.backgroundColor
                viewNode.mark.color = SettingOneScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.color = SettingOneScene.baseFill
                viewNode.continues.fontColor = SettingOneScene.labelStrokeColor
                viewNode.continueGameButton.color = SettingOneScene.iconStrokeColor
                viewNode.continueGameButton.colorBlendFactor = 1
                viewNode.start.fontColor = SettingOneScene.labelStrokeColor
                viewNode.startNewGameButton.color = SettingOneScene.iconStrokeColor
                viewNode.startNewGameButton.colorBlendFactor = 1
                viewNode.award.fontColor = SettingOneScene.labelStrokeColor
                viewNode.gameAwardButton.color = SettingOneScene.iconStrokeColor
                viewNode.gameAwardButton.colorBlendFactor = 1
                viewNode.settings.fontColor = SettingOneScene.labelStrokeColor
                viewNode.gameSettingsButton.color = SettingOneScene.iconStrokeColor
                viewNode.gameSettingsButton.colorBlendFactor = 1
                viewNode.guide.fontColor = SettingOneScene.labelStrokeColor
                viewNode.instructionsButton.color = SettingOneScene.iconStrokeColor
                viewNode.instructionsButton.colorBlendFactor = 1
            } else if view.name == "MenuScene" {
                let viewNode = view as! MenuScene
                view.backgroundColor = SettingOneScene.backgroundColor
                viewNode.mark.color = SettingOneScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.color = SettingOneScene.baseFill
                viewNode.base.colorBlendFactor = 1
                viewNode.sound.fontColor = SettingOneScene.labelStrokeColor
                viewNode.soundButton.color = SettingOneScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.score.fontColor = SettingOneScene.labelStrokeColor
                viewNode.scoreButton.color = SettingOneScene.iconStrokeColor
                viewNode.scoreButton.colorBlendFactor = 1
                viewNode.timer.fontColor = SettingOneScene.labelStrokeColor
                viewNode.timerButton.color = SettingOneScene.iconStrokeColor
                viewNode.timerButton.colorBlendFactor = 1
                viewNode.nightMode.fontColor = SettingOneScene.labelStrokeColor
                viewNode.nightModeButton.color = SettingOneScene.iconStrokeColor
                viewNode.nightModeButton.colorBlendFactor = 1
                viewNode.pastel.fontColor = SettingOneScene.labelStrokeColor
                viewNode.pastelButton.color = SettingOneScene.iconStrokeColor
                viewNode.pastelButton.colorBlendFactor = 1
                viewNode.colorBlind.fontColor = SettingOneScene.labelStrokeColor
                viewNode.colorBlindButton.color = SettingOneScene.iconStrokeColor
                viewNode.colorBlindButton.colorBlendFactor = 1
                viewNode.signup.fontColor = SettingOneScene.labelStrokeColor
                viewNode.signupButton.color = SettingOneScene.iconStrokeColor
                viewNode.signupButton.colorBlendFactor = 1
                viewNode.enterButton.color = SettingOneScene.exitIconStrokeColor
                viewNode.enterButton.colorBlendFactor = 1
            } else if view.name == "GameScene" {
                let viewNode = view as! GameScene
                view.backgroundColor = SettingOneScene.backgroundColor
                viewNode.mark.color = SettingOneScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.playerScoreLabel.fontColor = SettingOneScene.labelStrokeColor
                viewNode.playerTimerLabel.fontColor = SettingOneScene.labelStrokeColor
                viewNode.settingsButton.color = SettingOneScene.iconFillColor
                viewNode.settingsButton.colorBlendFactor = 1
                viewNode.graphButton.color = SettingOneScene.iconFillColor
                viewNode.graphButton.colorBlendFactor = 1
            }  else if view.name == "DefinitionScene" {
                let viewNode = view as! DefinitionScene
                view.backgroundColor = SettingOneScene.backgroundColor
                
            } else if view.name == "GameStatusScene" {
                let viewNode = view as! GameStatusScene
                view.backgroundColor = SettingOneScene.backgroundColor
                viewNode.mark.color = SettingOneScene.iconFillColor
                viewNode.mark.colorBlendFactor = 1
                
            } else if view.name == "IAPurchaseScene" {
                let viewNode = view as! IAPurchaseScene
                view.backgroundColor = SettingOneScene.backgroundColor
                
            } else if view.name == "OverlayScene" {
                let viewNode = view as! OverlayScene
                view.backgroundColor = SettingOneScene.backgroundColor
                
            }
            break
        case let SettingTwoScene as ColorGroupTwoSettingScene:
            if view.name == "MainMenuScene" {
                let viewNode = view as! MainMenuScene
                view.backgroundColor = SettingTwoScene.backgroundColor
                viewNode.mark.color = SettingTwoScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.color = SettingTwoScene.baseStroke
                viewNode.continues.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.continueGameButton.color = SettingTwoScene.iconStrokeColor
                viewNode.continueGameButton.colorBlendFactor = 1
                viewNode.start.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.startNewGameButton.color = SettingTwoScene.iconStrokeColor
                viewNode.startNewGameButton.colorBlendFactor = 1
                viewNode.award.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.gameAwardButton.color = SettingTwoScene.iconStrokeColor
                viewNode.gameAwardButton.colorBlendFactor = 1
                viewNode.settings.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.gameSettingsButton.color = SettingTwoScene.iconStrokeColor
                viewNode.gameSettingsButton.colorBlendFactor = 1
                viewNode.guide.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.instructionsButton.color = SettingTwoScene.iconStrokeColor
                viewNode.instructionsButton.colorBlendFactor = 1
            } else if view.name == "MenuScene" {
                let viewNode = view as! MenuScene
                view.backgroundColor = SettingTwoScene.backgroundColor
                viewNode.mark.color = SettingTwoScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.color = SettingTwoScene.baseFill
                viewNode.base.colorBlendFactor = 1
                viewNode.sound.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.soundButton.color = SettingTwoScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.score.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.scoreButton.color = SettingTwoScene.iconStrokeColor
                viewNode.scoreButton.colorBlendFactor = 1
                viewNode.timer.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.timerButton.color = SettingTwoScene.iconStrokeColor
                viewNode.timerButton.colorBlendFactor = 1
                viewNode.nightMode.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.nightModeButton.color = SettingTwoScene.iconStrokeColor
                viewNode.nightModeButton.colorBlendFactor = 1
                viewNode.pastel.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.pastelButton.color = SettingTwoScene.iconStrokeColor
                viewNode.pastelButton.colorBlendFactor = 1
                viewNode.colorBlind.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.colorBlindButton.color = SettingTwoScene.iconStrokeColor
                viewNode.colorBlindButton.colorBlendFactor = 1
                viewNode.signup.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.signupButton.color = SettingTwoScene.iconStrokeColor
                viewNode.signupButton.colorBlendFactor = 1
                viewNode.enterButton.color = SettingTwoScene.exitIconStrokeColor
                viewNode.enterButton.colorBlendFactor = 1
            } else if view.name == "GameScene" {
                let viewNode = view as! GameScene
                view.backgroundColor = SettingTwoScene.backgroundColor
                viewNode.mark.color = SettingTwoScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.playerScoreLabel.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.playerTimerLabel.fontColor = SettingTwoScene.labelStrokeColor
                viewNode.settingsButton.color = SettingTwoScene.iconFillColor
                viewNode.settingsButton.colorBlendFactor = 1
                viewNode.graphButton.color = SettingTwoScene.iconFillColor
                viewNode.graphButton.colorBlendFactor = 1
            }  else if view.name == "DefinitionScene" {
                let viewNode = view as! DefinitionScene
                view.backgroundColor = SettingTwoScene.backgroundColor

            } else if view.name == "GameStatusScene" {
                let viewNode = view as! GameStatusScene
                view.backgroundColor = SettingTwoScene.backgroundColor
                viewNode.mark.color = SettingTwoScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                
            } else if view.name == "IAPurchaseScene" {
                let viewNode = view as! IAPurchaseScene
                view.backgroundColor = SettingTwoScene.backgroundColor

            } else if view.name == "OverlayScene" {
                let viewNode = view as! OverlayScene
                view.backgroundColor = SettingTwoScene.backgroundColor

            }
            break
        case let SettingThreeScene as ColorGroupThreeSettingScene:
            if view.name == "MainMenuScene" {
                let viewNode = view as! MainMenuScene
                view.backgroundColor = SettingThreeScene.backgroundColor
                viewNode.mark.color = SettingThreeScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.color = SettingThreeScene.baseStroke
                viewNode.continues.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.continueGameButton.color = SettingThreeScene.iconStrokeColor
                viewNode.continueGameButton.colorBlendFactor = 1
                viewNode.start.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.startNewGameButton.color = SettingThreeScene.iconStrokeColor
                viewNode.startNewGameButton.colorBlendFactor = 1
                viewNode.award.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.gameAwardButton.color = SettingThreeScene.iconStrokeColor
                viewNode.gameAwardButton.colorBlendFactor = 1
                viewNode.settings.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.gameSettingsButton.color = SettingThreeScene.iconStrokeColor
                viewNode.gameSettingsButton.colorBlendFactor = 1
                viewNode.guide.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.instructionsButton.color = SettingThreeScene.iconStrokeColor
                viewNode.instructionsButton.colorBlendFactor = 1
            } else if view.name == "MenuScene" {
                let viewNode = view as! MenuScene
                view.backgroundColor = SettingThreeScene.backgroundColor
                viewNode.mark.color = SettingThreeScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.color = SettingThreeScene.baseFill
                viewNode.base.colorBlendFactor = 1
                viewNode.sound.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.soundButton.color = SettingThreeScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.score.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.scoreButton.color = SettingThreeScene.iconStrokeColor
                viewNode.scoreButton.colorBlendFactor = 1
                viewNode.timer.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.timerButton.color = SettingThreeScene.iconStrokeColor
                viewNode.timerButton.colorBlendFactor = 1
                viewNode.nightMode.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.nightModeButton.color = SettingThreeScene.iconStrokeColor
                viewNode.nightModeButton.colorBlendFactor = 1
                viewNode.pastel.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.pastelButton.color = SettingThreeScene.iconStrokeColor
                viewNode.pastelButton.colorBlendFactor = 1
                viewNode.colorBlind.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.colorBlindButton.color = SettingThreeScene.iconStrokeColor
                viewNode.colorBlindButton.colorBlendFactor = 1
                viewNode.signup.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.signupButton.color = SettingThreeScene.iconStrokeColor
                viewNode.signupButton.colorBlendFactor = 1
                viewNode.enterButton.color = SettingThreeScene.exitIconStrokeColor
                viewNode.enterButton.colorBlendFactor = 1
            } else if view.name == "GameScene" {
                let viewNode = view as! GameScene
                view.backgroundColor = SettingThreeScene.backgroundColor
                viewNode.mark.color = SettingThreeScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.playerScoreLabel.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.playerTimerLabel.fontColor = SettingThreeScene.labelStrokeColor
                viewNode.settingsButton.color = SettingThreeScene.iconFillColor
                viewNode.settingsButton.colorBlendFactor = 1
                viewNode.graphButton.color = SettingThreeScene.iconFillColor
                viewNode.graphButton.colorBlendFactor = 1
            }  else if view.name == "DefinitionScene" {
                let viewNode = view as! DefinitionScene
                view.backgroundColor = SettingThreeScene.backgroundColor
                
            } else if view.name == "GameStatusScene" {
                let viewNode = view as! GameStatusScene
                view.backgroundColor = SettingThreeScene.backgroundColor
                viewNode.mark.color = SettingThreeScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                
            } else if view.name == "IAPurchaseScene" {
                let viewNode = view as! IAPurchaseScene
                view.backgroundColor = SettingThreeScene.backgroundColor
                
            } else if view.name == "OverlayScene" {
                let viewNode = view as! OverlayScene
                view.backgroundColor = SettingThreeScene.backgroundColor
                
            }
            break
        case let SettingFourScene as ColorGroupFourSettingScene:
            if view.name == "MainMenuScene" {
                let viewNode = view as! MainMenuScene
                view.backgroundColor = SettingFourScene.backgroundColor
                viewNode.mark.color = SettingFourScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.color = SettingFourScene.baseStroke
                viewNode.continues.fontColor = SettingFourScene.labelStrokeColor
                viewNode.continueGameButton.color = SettingFourScene.iconStrokeColor
                viewNode.continueGameButton.colorBlendFactor = 1
                viewNode.start.fontColor = SettingFourScene.labelStrokeColor
                viewNode.startNewGameButton.color = SettingFourScene.iconStrokeColor
                viewNode.startNewGameButton.colorBlendFactor = 1
                viewNode.award.fontColor = SettingFourScene.labelStrokeColor
                viewNode.gameAwardButton.color = SettingFourScene.iconStrokeColor
                viewNode.gameAwardButton.colorBlendFactor = 1
                viewNode.settings.fontColor = SettingFourScene.labelStrokeColor
                viewNode.gameSettingsButton.color = SettingFourScene.iconStrokeColor
                viewNode.gameSettingsButton.colorBlendFactor = 1
                viewNode.guide.fontColor = SettingFourScene.labelStrokeColor
                viewNode.instructionsButton.color = SettingFourScene.iconStrokeColor
                viewNode.instructionsButton.colorBlendFactor = 1
            } else if view.name == "MenuScene" {
                let viewNode = view as! MenuScene
                view.backgroundColor = SettingFourScene.backgroundColor
                viewNode.mark.color = SettingFourScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.color = SettingFourScene.baseFill
                viewNode.base.colorBlendFactor = 1
                viewNode.sound.fontColor = SettingFourScene.labelStrokeColor
                viewNode.soundButton.color = SettingFourScene.iconStrokeColor
                viewNode.soundButton.colorBlendFactor = 1
                viewNode.score.fontColor = SettingFourScene.labelStrokeColor
                viewNode.scoreButton.color = SettingFourScene.iconStrokeColor
                viewNode.scoreButton.colorBlendFactor = 1
                viewNode.timer.fontColor = SettingFourScene.labelStrokeColor
                viewNode.timerButton.color = SettingFourScene.iconStrokeColor
                viewNode.timerButton.colorBlendFactor = 1
                viewNode.nightMode.fontColor = SettingFourScene.labelStrokeColor
                viewNode.nightModeButton.color = SettingFourScene.iconStrokeColor
                viewNode.nightModeButton.colorBlendFactor = 1
                viewNode.pastel.fontColor = SettingFourScene.labelStrokeColor
                viewNode.pastelButton.color = SettingFourScene.iconStrokeColor
                viewNode.pastelButton.colorBlendFactor = 1
                viewNode.colorBlind.fontColor = SettingFourScene.labelStrokeColor
                viewNode.colorBlindButton.color = SettingFourScene.iconStrokeColor
                viewNode.colorBlindButton.colorBlendFactor = 1
                viewNode.signup.fontColor = SettingFourScene.labelStrokeColor
                viewNode.signupButton.color = SettingFourScene.iconStrokeColor
                viewNode.signupButton.colorBlendFactor = 1
                viewNode.enterButton.color = SettingFourScene.exitIconStrokeColor
                viewNode.enterButton.colorBlendFactor = 1
            } else if view.name == "GameScene" {
                let viewNode = view as! GameScene
                view.backgroundColor = SettingFourScene.backgroundColor
                viewNode.mark.color = SettingFourScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.playerScoreLabel.fontColor = SettingFourScene.labelStrokeColor
                viewNode.playerTimerLabel.fontColor = SettingFourScene.labelStrokeColor
                viewNode.settingsButton.color = SettingFourScene.iconFillColor
                viewNode.settingsButton.colorBlendFactor = 1
                viewNode.graphButton.color = SettingFourScene.iconFillColor
                viewNode.graphButton.colorBlendFactor = 1
            }  else if view.name == "DefinitionScene" {
                let viewNode = view as! DefinitionScene
                view.backgroundColor = SettingFourScene.backgroundColor
                
            } else if view.name == "GameStatusScene" {
                let viewNode = view as! GameStatusScene
                view.backgroundColor = SettingFourScene.backgroundColor
                viewNode.mark.color = SettingFourScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                
            } else if view.name == "IAPurchaseScene" {
                let viewNode = view as! IAPurchaseScene
                view.backgroundColor = SettingFourScene.backgroundColor
                
            } else if view.name == "OverlayScene" {
                let viewNode = view as! OverlayScene
                view.backgroundColor = SettingFourScene.backgroundColor
                
            }
            break
        case let AwardOneScene as ColorGroupOneAwardScene:
            if view.name == "AwardScene" {
                let viewNode = view as! AwardScene
                view.backgroundColor = AwardOneScene.backgroundColor
                viewNode.mark.color = AwardOneScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.colorBlendFactor = 1
                viewNode.shareButton.color = AwardOneScene.iconFillColor
                viewNode.shareButton.colorBlendFactor = 1
                viewNode.awardGoldAccuracy.color = AwardOneScene.awardGoldFillColor
                viewNode.awardGoldAccuracy.colorBlendFactor = 1
                viewNode.awardSilverAccuracy.color = AwardOneScene.awardSilverFillColor
                viewNode.awardSilverAccuracy.colorBlendFactor = 1
                viewNode.awardBronzeAccuracy.color = AwardOneScene.awardBronzeFillColor
                viewNode.awardBronzeAccuracy.colorBlendFactor = 1
                viewNode.awardGoldTime.color = AwardOneScene.awardGoldFillColor
                viewNode.awardGoldTime.colorBlendFactor = 1
                viewNode.awardSilverTime.color = AwardOneScene.awardSilverFillColor
                viewNode.awardSilverTime.colorBlendFactor = 1
                viewNode.awardBronzeTime .color = AwardOneScene.awardBronzeFillColor
                viewNode.awardBronzeTime .colorBlendFactor = 1
                viewNode.awardTitleLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.awardTitleDescriptionLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.accuracyTitleLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.timeTitleLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.accuracyGoldDescriptionLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.accuracySilverDescriptionLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.accuracyBronzeDescriptionLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.timeGoldDescriptionLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.timeSilverDescriptionLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.timeBronzeDescriptionLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.accuracyGoldCountLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.accuracySilverCountLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.accuracyBronzeCountLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.timeGoldCountLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.timeSilverCountLabel.fontColor = AwardOneScene.labelStrokeColor
                viewNode.timeBronzeCountLabel.fontColor = AwardOneScene.labelStrokeColor
            }
            break
        case let AwardTwoScene as ColorGroupTwoAwardScene:
            if view.name == "AwardScene" {
                let viewNode = view as! AwardScene
                view.backgroundColor = AwardTwoScene.backgroundColor
                viewNode.mark.color = AwardTwoScene.markFillColor
                viewNode.mark.colorBlendFactor = 1
                viewNode.base.color = AwardTwoScene.baseFill
                viewNode.base.colorBlendFactor = 1
                viewNode.shareButton.color = AwardTwoScene.iconFillColor
                viewNode.shareButton.colorBlendFactor = 1
                viewNode.awardGoldAccuracy.color = AwardTwoScene.awardGoldFillColor
                viewNode.awardGoldAccuracy.colorBlendFactor = 1
                viewNode.awardSilverAccuracy.color = AwardTwoScene.awardSilverFillColor
                viewNode.awardSilverAccuracy.colorBlendFactor = 1
                viewNode.awardBronzeAccuracy.color = AwardTwoScene.awardBronzeFillColor
                viewNode.awardBronzeAccuracy.colorBlendFactor = 1
                viewNode.awardGoldTime.color = AwardTwoScene.awardGoldFillColor
                viewNode.awardGoldTime.colorBlendFactor = 1
                viewNode.awardSilverTime.color = AwardTwoScene.awardSilverFillColor
                viewNode.awardSilverTime.colorBlendFactor = 1
                viewNode.awardBronzeTime .color = AwardTwoScene.awardBronzeFillColor
                viewNode.awardBronzeTime .colorBlendFactor = 1
                viewNode.awardTitleLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.awardTitleDescriptionLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.accuracyTitleLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.timeTitleLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.accuracyGoldDescriptionLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.accuracySilverDescriptionLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.accuracyBronzeDescriptionLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.timeGoldDescriptionLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.timeSilverDescriptionLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.timeBronzeDescriptionLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.accuracyGoldCountLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.accuracySilverCountLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.accuracyBronzeCountLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.timeGoldCountLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.timeSilverCountLabel.fontColor = AwardTwoScene.labelStrokeColor
                viewNode.timeBronzeCountLabel.fontColor = AwardTwoScene.labelStrokeColor
            }
            break
        default:
            view.backgroundColor = colorGroupOneSettingScene.backgroundColor
            print("No theme selected for \(view.name)")
            break
        }
        
    }

    func backgroundColor() -> UIColor {
        switch currentMode() {
        case Mode.colorBlind:
            break
        case Mode.nightMode:
            break
        case Mode.pastel:
            break
        case Mode.normal:
            break
        }
        return .clear
    }
    
    
    // MARK: For graphs
    func graphFillAndStroke() -> (fill: SKColor?, stroke: SKColor?) {
        switch currentMode() {
        case Mode.colorBlind:
            let graphFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
            let graphStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
            return(graphFillColor, graphStrokeColor)
        case Mode.nightMode:
            let graphFillColor = #colorLiteral(red: 0.06274509804, green: 0.09019607843, blue: 0.1137254902, alpha: 1)
            let graphStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
            return(graphFillColor, graphStrokeColor)
        case Mode.pastel:
            let graphFillColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
            let graphStrokeColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
            return(graphFillColor, graphStrokeColor)
        case Mode.normal:
            let graphFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            let graphStrokeColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
            return(graphFillColor, graphStrokeColor)
        }
    }
    
    // pastel - group one
    // normal - group two
    // night mode - group three
    // color blind - group four
    func colorFillAndStrokeBoardAndButton(board: Bool = true, condition: Bool = false) -> (fill: SKColor?, stroke: SKColor?) {
        
        switch currentMode() {
        case Mode.pastel: //group one colors
            let boardFillColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
            let boardStrokeColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
            let boardConditionFillColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
            let boardConditionStrokeColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
            let buttonFillColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
            let buttonStrokeColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
            let buttonHighlightFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
            let buttonHighlightStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
         //   let textFontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            if board {
                if condition {
                    return (boardConditionFillColor, boardConditionStrokeColor)
                } else {
                    return (boardFillColor, boardStrokeColor)
                }
            } else if !board { // button
                if condition {
                    return (buttonHighlightFillColor, buttonHighlightStrokeColor)
                } else {
                    return (buttonFillColor, buttonStrokeColor)
                }
            }
        case Mode.normal: // group two colors
        let boardFillColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
        let boardStrokeColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
        let boardConditionFillColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
        let boardConditionStrokeColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
        let buttonFillColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
        let buttonStrokeColor = #colorLiteral(red: 0.1176470588, green: 0.1725490196, blue: 0.2156862745, alpha: 1)
        let buttonHighlightFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
        let buttonHighlightStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
      //  let textFontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        if board {
            if condition {
                return (boardConditionFillColor, boardConditionStrokeColor)
            } else {
                return (boardFillColor, boardStrokeColor)
            }
        } else if !board { // button
            if condition {
                return (buttonHighlightFillColor, buttonHighlightStrokeColor)
            } else {
                return (buttonFillColor, buttonStrokeColor)
            }
        }
        case Mode.nightMode: // group three colors
            let boardFillColor = #colorLiteral(red: 0.4941176471, green: 0.7882352941, blue: 0.9215686275, alpha: 1)
            let boardStrokeColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
            let boardConditionFillColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
            let boardConditionStrokeColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
            let buttonFillColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)
            let buttonStrokeColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
            let buttonHighlightFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
            let buttonHighlightStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
          //  let textFontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            if board {
                if condition {
                    return (boardConditionFillColor, boardConditionStrokeColor)
                } else {
                    return (boardFillColor, boardStrokeColor)
                }
            } else if !board { // button
                if condition {
                    return (buttonHighlightFillColor, buttonHighlightStrokeColor)
                } else {
                    return (buttonFillColor, buttonStrokeColor)
                }
            }
        case Mode.colorBlind: // group four colors
            let boardFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
            let boardStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
            let boardConditionFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
            let boardConditionStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
            let buttonFillColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
            let buttonStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
            let buttonHighlightFillColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
            let buttonHighlightStrokeColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
         //   let textFontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            if board {
                if condition {
                     return (boardConditionFillColor, boardConditionStrokeColor)
                } else {
                     return (boardFillColor, boardStrokeColor)
                }
            } else if !board { // button
                if condition {
                    return (buttonHighlightFillColor, buttonHighlightStrokeColor)
                } else {
                    return (buttonFillColor, buttonStrokeColor)
                }
            }
        }
        return (nil, nil)
    }
    
    // MARK:- General fill
    func fillColor() -> UIColor? {
        switch currentMode() {
        case Mode.colorBlind:
            return .lightGray
        case Mode.pastel:
            return pastelBackgroundTile
        default:
            return redTile
        }
    }
    
    func arrowColor() -> UIColor? {
        switch currentMode() {
        case Mode.colorBlind:
            return .darkGray
        default:
            return greenTile
        }
    }
}
