// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(Linux)
let targets: [Target] = [
    .systemLibrary(name: "OpenGL_Linux"),
    .target(name: "SwiftGL", dependencies: ["OpenGL_Linux"]),
]
#elseif os(Windows)
let targets: [Target] = [
    //.binaryTarget(name: "GLEW", path: "./Sources/GLEW.xcframework"),
    .target(name: "GLEW_Windows"),
    .target(name: "SwiftGL", dependencies: ["GLEW"]),
]
#elseif (os(macOS) && !targetEnvironment(macCatalyst)) || os(iOS) || os(tvOS)
let targets: [Target] = [
    .target(name: "SwiftGL", dependencies: [])
]
#endif

let package = Package(
    name: "SwiftGL",
    products: [
        .library(name: "SwiftGL", targets: ["SwiftGL"]),
    ],
    targets: targets
)
 
