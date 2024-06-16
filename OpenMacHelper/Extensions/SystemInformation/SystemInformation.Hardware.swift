//
//  SystemInformation.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension SystemInformation.Hardware.Model {
    init() {
        name = SystemProfiler.hardware?["machine_name"] as? String
        identifier = SystemProfiler.hardware?["machine_model"] as? String
        number = SystemProfiler.hardware?["model_number"] as? String
        isAppleSilicon = {
            if SystemProfiler.hardware?["chip_type"] != nil { return true }
            if SystemProfiler.hardware?["cpu_type"] != nil { return false }
            return nil
        }()
        isLaptop = name.hasPrefix("MacBook")
        systemImage = switch name {
        case _ where name.hasPrefix("MacBook"):
            switch identifier {
            case "Mac14,7": "macbook.gen1"
            case _ where identifier.hasPrefix("MacBookPro18"): "macbook.gen2"
            case _ where identifier.hasPrefix("MacBook"): "macbook.gen1"
            default: "macbook.gen2"
            }
        case "Mac mini": "macmini"
        case "Mac Studio": "macstudio"
        case "Mac Pro":
            switch identifier {
            case "MacPro3,1", "MacPro4,1", "MacPro5,1": "macpro.gen1"
            case "MacPro6,1": "macpro.gen2"
            default: "macpro.gen3"
            }
        case "Xserve": "xserve"
        default: "desktopcomputer"
        }
        marketingName = {
            guard let serialNumber = SystemProfiler.hardware?["serial_number"] as? String, [11, 12].contains(serialNumber.count) else { return nil }
            let url: String = "https://support-sp.apple.com/sp/product?cc=\(serialNumber.dropFirst(8))&lang=\(Locale.currentLanguageCode ?? String())"
            guard let output = transferURL(url), output.contains("<configCode>") else { return nil }
            guard let marketingName = output.components(separatedBy: "<configCode>").last?.components(separatedBy: "</configCode>").first else { return nil }
            return LocalizedStringKey(marketingName)
        }()
    }
}

extension SystemInformation.Hardware.Specifications {
    init() { memory = Measurement(SystemProfiler.hardware?["physical_memory"]) }
}

extension SystemInformation.Hardware.Specifications.CPU {
    init() {
        type = SystemProfiler.hardware?["chip_type"] as? String ?? SystemProfiler.hardware?["cpu_type"] as? String
        speed = Measurement(SystemProfiler.hardware?["current_processor_speed"])
    }
}

extension SystemInformation.Hardware.Specifications.CPU.Cores {
    init() {
        if let numberProcessors = SystemProfiler.hardware?["number_processors"] as? Int {
            (total, performance, efficiency) = (numberProcessors, 0, 0)
        } else if let components = [Int]((SystemProfiler.hardware?["number_processors"] as? String)?.remove("proc ").components(separatedBy: ":")) {
            (total, performance, efficiency) = (components[safe: 0], components[safe: 1], components[safe: 2])
        } else { (total, performance, efficiency) = (nil, nil, nil) }
    }
}

extension SystemInformation.Hardware.Machine {
    init() {
        serialNumber = SystemProfiler.hardware?["serial_number"] as? String
        hardwareUUID = SystemProfiler.hardware?["platform_UUID"] as? String
        provisioningUDID = SystemProfiler.hardware?["provisioning_UDID"] as? String
    }
}