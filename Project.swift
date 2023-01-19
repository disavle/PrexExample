import ProjectDescription

public var scripts: [TargetScript] {

	var scripts = [TargetScript]()

	let swiftLintScriptString = "SwiftLint/swiftlint"
	let swiftLintScript = TargetScript.post(script: swiftLintScriptString, name: "SwiftLint")

	scripts.append(swiftLintScript)
	return scripts
}

let target = Target(
	name: "RnM",
	platform: .iOS,
	product: .app,
	bundleId: "DSAVELEV.MVP",
	deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
	infoPlist: "RnM/Configs/Info.plist",
	sources: ["RnM/Sources/**"],
	resources: [
		"RnM/Resources/**"
	],
	scripts: scripts,
	dependencies: [
		.external(name: "SnapKit")
	]
)

let targetCS = Target(
    name: "RnMCS",
    platform: .iOS,
    product: .app,
    bundleId: "DSAVELEV.CleanSwift",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
    infoPlist: "RnMCS/Configs/Info.plist",
    sources: ["RnMCS/Sources/**"],
    resources: [
	  "RnMCS/Resources/**"
    ],
    scripts: scripts,
    dependencies: [
	  .external(name: "SnapKit")
    ]
)

let project = Project(
	name: "RnM",
	targets: [target, targetCS]
)

