Class {
	#name : #ScenarioStep,
	#superclass : #Object,
	#instVars : [
		'type',
		'text',
		'result'
	],
	#category : #Scenarios
}

{ #category : #constants }
ScenarioStep class >> failedResult [

	^#failed
]

{ #category : #constants }
ScenarioStep class >> notRunResult [

	^ #notRun
]

{ #category : #constants }
ScenarioStep class >> passedResult [

	^ #passed
]

{ #category : #constants }
ScenarioStep class >> undefinedResult [

	^ #undefined
]

{ #category : #results }
ScenarioStep >> beFailed [

	result := self class failedResult
]

{ #category : #results }
ScenarioStep >> beNotRun [

	result := self class notRunResult
]

{ #category : #results }
ScenarioStep >> bePassed [

	result := self class passedResult
]

{ #category : #results }
ScenarioStep >> beUndefined [

	result := self class undefinedResult
]

{ #category : #testing }
ScenarioStep >> isFailed [

	^ result == self class failedResult
]

{ #category : #testing }
ScenarioStep >> isPassed [

	^result == self class passedResult
]

{ #category : #testing }
ScenarioStep >> isSkipped [

	^ result == self class notRunResult
]

{ #category : #testing }
ScenarioStep >> isUndefined [

	^ result == self class undefinedResult
]

{ #category : #running }
ScenarioStep >> run: aScenarioResult with: stepDefinitions [

	[
	[
	self runStepWith: stepDefinitions.
	self bePassed ]
		on: UndefinedStep
		do: [ :ex |
			self beUndefined.
			ex pass ] ]
		on: TestFailure , Error
		do: [ :ex |
			self beFailed.
			ex pass ]
]

{ #category : #initialization }
ScenarioStep >> type: aSymbol text: aString [

	type := aSymbol.
	text := aString.
	self beNotRun
]

{ #category : #testing }
ScenarioStep >> wasNotRun [

	^ result == self class notRunResult
]