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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "4.1.0-beta.22")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayerLocal-4.1.0-beta.22.xcframework.zip",
			checksum: "1bd725f8dd2e3af48645d117238884ad2a067da317f25c6a9eedb109b34ff4d5"
		)
	]
)