
import ProjectDescription

let target = Target(
	name: "Prex",
	platform: .iOS,
	product: .app,
	bundleId: "DSAVELEV.Prex",
	deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
	infoPlist: "Prex/Configs/Info.plist",
	sources: ["Prex/Sources/**"],
	resources: [
		"Prex/Resources/**"
	],
	dependencies: []
)

let project = Project(
	name: "Prex",
	targets: [target]
)

