"
A feature result to capture results for a feature separately from those of a scenario
"
Class {
	#name : #FeatureResult,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #'Scenarios-Base'
}

{ #category : #adding }
FeatureResult >> addResult: aScenarioResult [

	^ results add: aScenarioResult
]

{ #category : #accessing }
FeatureResult >> failedCount [

	^ (results reject: [ :each | each isPassed or: [ each isPending ] ]) size
]

{ #category : #accessing }
FeatureResult >> failedStepCount [

	^ results inject: 0 into: [ :sum :each | sum + each failedCount ]
]

{ #category : #initialization }
FeatureResult >> initialize [

	super initialize.
	results := OrderedCollection new
]

{ #category : #accessing }
FeatureResult >> passedCount [

	^ (results select: [ :each | each isPassed ]) size
]

{ #category : #accessing }
FeatureResult >> passedStepCount [

	^ results inject: 0 into: [ :sum :each | sum + each passedCount ]
]

{ #category : #accessing }
FeatureResult >> pendingCount [

	^ (results select: [ :each | each isPending ]) size
]

{ #category : #accessing }
FeatureResult >> pendingStepCount [

	^ results inject: 0 into: [ :sum :each | sum + each pendingCount ]
]

{ #category : #printing }
FeatureResult >> printOn: aStream [

	aStream
		nextPutAll: self resultCount asString;
		nextPutAll: ' scenarios (';
		nextPutAll: self passedCount asString;
		nextPutAll: ' passed, ';
		nextPutAll: self pendingCount asString;
		nextPutAll: ' pending, ';
		nextPutAll: self failedCount asString;
		nextPutAll: ' failed)';
		nextPutAll: String cr;
		nextPutAll: self stepCount asString;
		nextPutAll: ' steps (';
		nextPutAll: self passedStepCount asString;
		nextPutAll: ' passed, ';
		nextPutAll: self failedStepCount asString;
		nextPutAll: ' failed, ';
		nextPutAll: self undefinedStepCount asString;
		nextPutAll: ' undefined, ';
		nextPutAll: self pendingStepCount asString;
		nextPutAll: ' pending, ';
		nextPutAll: self skippedStepCount asString;
		nextPutAll: ' skipped)'
]

{ #category : #accessing }
FeatureResult >> resultCount [

	^ results size
]

{ #category : #accessing }
FeatureResult >> skippedStepCount [

	^ results inject: 0 into: [ :sum :each | sum + each skippedCount ]
]

{ #category : #accessing }
FeatureResult >> stepCount [

	^ results inject: 0 into: [ :sum :each | sum + each resultCount ]
]

{ #category : #accessing }
FeatureResult >> undefinedStepCount [

	^ results inject: 0 into: [ :sum :each | sum + each undefinedCount ]
]
