// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXDataLayerLocal",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXDataLayerLocal",
			targets: ["GXDataLayerLocalWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.5.0-beta.15")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayerLocal-1.5.0-beta.15.xcframework.zip",
			checksum: "7f1fd117cdebb2406063dd121e41d1fa16da2df47dc8b871394de02b288f32a0"
		)
	]
)