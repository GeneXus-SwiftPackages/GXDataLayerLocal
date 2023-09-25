// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXDataLayerLocal",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXDataLayerLocal",
			targets: ["GXDataLayerLocalWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.2.0-rc.29")
	],
	targets: [
		.target(name: "GXDataLayerLocalWrapper",
				dependencies: [
					"GXDataLayerLocal",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayerLocal",
			url: "https://pkgs.genexus.dev/iOS/preview/GXDataLayerLocal-1.2.0-rc.29.xcframework.zip",
			checksum: "c6fe6f0eb43877488f060528fd25cfef8b7518237d1b351fc260537fd9d29fcf"
		)
	]
)