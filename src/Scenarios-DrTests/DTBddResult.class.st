"
A result container for Dr. Test
"
Class {
	#name : #DTBddResult,
	#superclass : #DTPluginResult,
	#instVars : [
		'testsResult'
	],
	#category : #'Scenarios-DrTests-Plugin'
}

{ #category : #accessing }
DTBddResult >> buildTreeForUI [
	<dtBehaviorDrivenDevelopmentResultTreeNamed: 'Grouped by type of result' order: 1>

	^ DTTreeNode new
		subResults: {
			DTTreeNode new
				name: DTTestResultType error pluralName;
				subResults: (self buildLeavesFrom: self passed type: DTTestResultType error);
				startExpanded;
				displayColorIfNotEmpty: TestResult defaultColorBackGroundForErrorTest;
				yourself.
			DTTreeNode new
				name: DTTestResultType fail pluralName;
				subResults: (self buildLeavesFrom: self failed type: DTTestResultType fail);
				startExpanded;
				displayColorIfNotEmpty: TestResult defaultColorBackGroundForFailureTest.
		};
		yourself
]

{ #category : #tests }
DTBddResult >> testResults: anObject [
	testsResult := anObject
]
