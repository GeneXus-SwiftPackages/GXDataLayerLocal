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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.0.0-beta.20230710170706")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayerLocal-1.0.0-beta.20230710170706.xcframework.zip",
			checksum: "16f28c263a7bf2666cabc5791afaf3fd65f401dd0c8568b2157f2715e940e63d"
		)
	]
)