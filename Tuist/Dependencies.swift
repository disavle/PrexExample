import ProjectDescription

let dependencies = Dependencies(
	swiftPackageManager: [
		.remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMajor(from: "5.0.1")),
	],
	platforms: [.iOS]
)
