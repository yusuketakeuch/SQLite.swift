// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SQLite.swift",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10),
        .watchOS(.v3),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "SQLite",
            type: .dynamic,
            targets: ["SQLite"]
        )
    ],
    targets: [
        .target(
            name: "SQLite",
            exclude: [
                "Info.plist"
            ],
         cSettings: [
           .define("BUILD_LIBRARY_FOR_DISTRIBUTION", to: "YES")
         ]
        ),
        .testTarget(
            name: "SQLiteTests",
            dependencies: [
                "SQLite"
            ],
            path: "Tests/SQLiteTests",
            exclude: [
                "Info.plist"
            ],
            resources: [
                .copy("Resources")
            ]
        )
    ]
)

#if os(Linux)
package.dependencies = [
    .package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")
]
package.targets.first?.dependencies += [
    .product(name: "CSQLite", package: "CSQLite")
]
#endif
