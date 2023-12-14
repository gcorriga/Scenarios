Class {
	#name : #FeatureResult,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #Scenarios
}

{ #category : #adding }
FeatureResult >> addResult: aScenarioResult [

	^results add: aScenarioResult
]

{ #category : #accessing }
FeatureResult >> failedCount [

	^results inject: 0 into: [ :sum :each | sum + each failedCount ]
]

{ #category : #initialization }
FeatureResult >> initialize [

	results := OrderedCollection new
]

{ #category : #accessing }
FeatureResult >> passedCount [

	^results inject: 0 into: [ :sum :each | sum + each passedCount ]
]

{ #category : #printing }
FeatureResult >> printOn: aStream [

	aStream
		nextPutAll: self passedCount asString;
		nextPutAll: ' passed, ';
		nextPutAll: self failedCount asString;
		nextPutAll: ' failed, ';
		nextPutAll: self undefinedCount asString;
		nextPutAll: ' undefined, ';
		nextPutAll: self skippedCount asString;
		nextPutAll: ' skipped.'
]

{ #category : #accessing }
FeatureResult >> resultCount [

	^results size
]

{ #category : #accessing }
FeatureResult >> skippedCount [

	^ results inject: 0 into: [ :sum :each | sum + each skippedCount ]
]

{ #category : #accessing }
FeatureResult >> undefinedCount [

	^results inject: 0 into: [ :sum :each | sum + each undefinedCount ]
]