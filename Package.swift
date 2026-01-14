// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXDataLayerLocal",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXDataLayerLocal",
			targets: ["GXDataLayerLocalWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "4.0.8")
	],
	targets: [
		.target(name: "GXDataLayerLocalWrapper",
				dependencies: [
					"GXDataLayerLocal",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayerLocal",
			url: "https://pkgs.genexus.dev/iOS/releases/GXDataLayerLocal-4.0.8.xcframework.zip",
			checksum: "40d56e987b8868761c23654fcbc2ab4bcc9778ee5d5b2dfda8d7647d8bfd2e6e"
		)
	]
)