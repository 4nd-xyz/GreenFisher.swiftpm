// swift-tools-version: 5.5

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "GreenFisher",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "GreenFisher",
            targets: ["App"],
            teamIdentifier: "PN8K78V28P",
            displayVersion: "1.0",
            bundleVersion: "1",
            iconAssetName: "AppIcon",
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .landscapeLeft,
                .landscapeRight
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "App",
            path: "App",
            resources: [
                .process("Resources")
            ]
        )
    ]
)