// swift-tools-version:5.1
//
//  Package.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite. All rights reserved.
//
import PackageDescription

let package = Package(
    name: "Spy",
    products: [
        .library(
            name: "Spy",
            targets: ["Spy"])
    ],
    targets: [
        .target(
            name: "Spy",
            dependencies: [],
            path: "Spy"),
        .testTarget(
            name: "SpyTests",
            dependencies: ["SpyTests"],
            path: "SpyTests")
    ]
)
