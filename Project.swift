import ProjectDescription

public var scripts: [TargetScript] {

	var scripts = [TargetScript]()

	let swiftLintScriptString = "SwiftLint/swiftlint"
	let swiftLintScript = TargetScript.post(script: swiftLintScriptString, name: "SwiftLint")

	scripts.append(swiftLintScript)
	return scripts
}

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
	scripts: scripts,
	dependencies: [
		.external(name: "SnapKit")
	]
)

let project = Project(
	name: "Prex",
	targets: [target]
)

