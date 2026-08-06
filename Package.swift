//===----------------------------------------------------------------------===//
//
// This source file is part of the Foundation Models open source project.
//
// Copyright © 2024-2027 Apple Inc. and the Foundation Models project authors.
//
// Licensed under the Apache License v2.0
//
// See LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

// swift-tools-version: 6.2
import PackageDescription

let package = Package(
  name: "foundation-models-utilities",
  platforms: [
    .macOS("27.0"),
    .iOS("27.0"),
    .visionOS("27.0"),
    .watchOS("27.0")
  ],
  products: [
    .library(
      name: "FoundationModelsUtilities",
      targets: ["FoundationModelsUtilities"]
    )
  ],
  traits: [
    // Compile against ServerFoundationModels — the open-source,
    // runs-anywhere reimplementation of the FoundationModels surface —
    // instead of Apple's framework. Off by default. Enable from a consumer:
    //   .package(url: …, traits: ["ServerFoundationModels"])
    .trait(
      name: "ServerFoundationModels",
      description: "Use euwars/ServerFoundationModels instead of Apple's FoundationModels."
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/euwars/ServerFoundationModels.git",
      from: "0.6.0"
    )
  ],
  targets: [
    .target(
      name: "FoundationModelsUtilities",
      dependencies: [
        .product(
          name: "ServerFoundationModels",
          package: "ServerFoundationModels",
          condition: .when(traits: ["ServerFoundationModels"])
        )
      ],
      swiftSettings: [
        .enableExperimentalFeature("InternalImportsByDefault"),
        .enableExperimentalFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("MemberImportVisibility")
      ]
    ),
    .testTarget(
      name: "FoundationModelsUtilitiesTests",
      dependencies: [
        "FoundationModelsUtilities",
      ],
      swiftSettings: [
        .enableExperimentalFeature("InternalImportsByDefault"),
        .enableExperimentalFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("MemberImportVisibility")
      ]
    ),
    .testTarget(
      name: "FoundationModelsUtilitiesIntegrationTests",
      dependencies: [
        "FoundationModelsUtilities",
      ],
      swiftSettings: [
        .enableExperimentalFeature("InternalImportsByDefault"),
        .enableExperimentalFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("MemberImportVisibility")
      ]
    ),
  ],
  swiftLanguageModes: [.v6]
)
