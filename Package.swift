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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", branch: "beta")
	],
	targets: [
		.target(name: "GXDataLayerLocalWrapper",
				dependencies: [
					"GXDataLayerLocal",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.tvOS, .iOS, .watchOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayerLocal",
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayerLocal-1.0.0-beta+20230306150353.xcframework.zip",
			checksum: "630e867bb54e5c346406456e8a50bb111b520051d8f4837e794aa0bfbac98be7"
		)
	]
)