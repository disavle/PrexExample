import ProjectDescription

public var scripts: [TargetScript] {

	var scripts = [TargetScript]()

	let swiftLintScriptString = "SwiftLint/swiftlint"
	let swiftLintScript = TargetScript.post(script: swiftLintScriptString, name: "SwiftLint")

	scripts.append(swiftLintScript)
	return scripts
}

let target = Target(
	name: "MVP",
	platform: .iOS,
	product: .app,
	bundleId: "DSAVELEV.MVP",
	deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
	infoPlist: "MVP/Configs/Info.plist",
	sources: ["MVP/Sources/**"],
	resources: [
		"MVP/Resources/**"
	],
	scripts: scripts,
	dependencies: [
		.external(name: "SnapKit")
	]
)

let project = Project(
	name: "MVP",
	targets: [target]
)

