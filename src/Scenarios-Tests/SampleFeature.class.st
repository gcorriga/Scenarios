"
A sample feature with sample scenarios used as an example and within tests
"
Class {
	#name : #SampleFeature,
	#superclass : #Feature,
	#category : #'Scenarios-Tests-Sample'
}

{ #category : #steps }
SampleFeature >> errorScenario [

	<Then: 'The scenario could raise an error'>
	self error: 'an error'
]

{ #category : #steps }
SampleFeature >> failingScenario [

	<Then: 'The scenario could fail'>
	self assert: false
]

{ #category : #scenarios }
SampleFeature >> featureGetsRun [
	<Scenario: 'Running a scenario'>
	
	self
		given: 'A feature with one scenario';
		when: 'The feature is run';
		then: 'The scenario steps get verified'
]

{ #category : #steps }
SampleFeature >> featureWithOneScenario [

	<Given: 'A feature with one scenario'>
	
]

{ #category : #steps }
SampleFeature >> pendingScenario [

	<Then: 'The scenario could be pending'>
	self pending
]

{ #category : #steps }
SampleFeature >> runTheScenario [

	<When: 'The feature is run'>
	
]

{ #category : #scenarios }
SampleFeature >> scenarioCanBePending [

	<Scenario: 'A scenario can be pending'>
	self
		given: 'A feature with one scenario';
		when: 'The feature is run';
		then: 'The scenario could be pending'
]

{ #category : #scenarios }
SampleFeature >> scenarioCanFail [
	<Scenario: 'A scenario can fail'>

	self
		given: 'A feature with one scenario';
		when: 'The feature is run';
		then: 'The scenario could fail'
]

{ #category : #scenarios }
SampleFeature >> scenarioCanFailWithError [
	<Scenario: 'A scenario can fail with an error'>
	
	self
		given: 'A feature with one scenario';
		when: 'The feature is run';
		then: 'The scenario could raise an error'
]

{ #category : #scenarios }
SampleFeature >> scenarioHasSteps [
	<Scenario: 'A scenario has one or more steps'>
	
	self
		given: 'A scenario with steps';
		when: 'A Scenario object gets created from it';
		then: 'The Scenario object has all the steps'
]

{ #category : #steps }
SampleFeature >> verifyTheSteps [

	<Then: 'The scenario steps get verified'>
	
]
