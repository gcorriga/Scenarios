"
A scenario is a written description of your products behavior from one or more users perspectives
"
Class {
	#name : #Scenario,
	#superclass : #Object,
	#instVars : [
		'title',
		'steps',
		'feature'
	],
	#category : #'Scenarios-Base'
}

{ #category : #'instance creation' }
Scenario class >> title: aString feature: aFeature [

	^ self new
		  title: aString feature: aFeature;
		  yourself
]

{ #category : #steps }
Scenario >> addStep: aSymbol text: aString [

	steps add: (ScenarioStep type: aSymbol text: aString scenario: self)
]

{ #category : #accessing }
Scenario >> feature [

	^feature
]

{ #category : #steps }
Scenario >> given: aString [

	self addStep: #Given text: aString
]

{ #category : #testing }
Scenario >> hasSteps [

	^ steps isNotEmpty
]

{ #category : #initialization }
Scenario >> initialize [ 

	super initialize.
	steps := OrderedCollection new
]

{ #category : #printing }
Scenario >> printOn: aStream [

	aStream
		nextPutAll: 'Scenario: ';
		nextPutAll: self title asString
]

{ #category : #running }
Scenario >> run [

	| result |
	result := ScenarioResult scenario: self.
	self run: result.
	^ result
]

{ #category : #running }
Scenario >> run: aScenarioResult [
	"Run the scenario (receiver) by using the given object to store the result" 

	aScenarioResult addResults: steps.
	steps do: [ :each |
		[ each run ]
			on: UndefinedStep , PendingStep , TestFailure , Error
			do: [ :ex | ^ self ] ]
]

{ #category : #accessing }
Scenario >> steps [

	^ steps
]

{ #category : #steps }
Scenario >> then: aString [ 
	self addStep: #Then text: aString.
]

{ #category : #comparision }
Scenario >> threeWayCompareTo: aScenario [

	^ self title threeWayCompareTo: aScenario title
]

{ #category : #accessing }
Scenario >> title [
	^ title
]

{ #category : #initialization }
Scenario >> title: aString feature: aFeature [

	title := aString.
	feature := aFeature
]

{ #category : #steps }
Scenario >> when: aString [ 
	self addStep: #When text: aString
]
