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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.3.0-beta.11")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayerLocal-1.3.0-beta.11.xcframework.zip",
			checksum: "3dbfa1820c70fcb7801a1c35497bde8b1ccfbef9dc5c328748d02fe79c0466a9"
		)
	]
)