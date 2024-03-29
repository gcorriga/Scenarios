"
Basic scenarios for running single scenarios
"
Class {
	#name : #RunningScenarioFeature,
	#superclass : #Feature,
	#instVars : [
		'result',
		'theScenario'
	],
	#category : #'Scenarios-Features'
}

{ #category : #steps }
RunningScenarioFeature >> allRemainingStepsAreMarkedAsSkipped [

	<Then: 'all remaining steps are marked as skipped'>
	self assert: result skippedCount equals: 2.
	self
		assert: result skipped last text
		equals: 'the test scenario fails'
]

{ #category : #steps }
RunningScenarioFeature >> allStepsAreCorrectlyImplemented [

	<Given: 'all its steps are correctly implemented'>
	theScenario
		addStep: #Given text: 'a test scenario';
		addStep: #When text: 'we run the test scenario';
		addStep: #Then text: 'the test scenario passes'
]

{ #category : #steps }
RunningScenarioFeature >> allStepsPass [

	<Then: 'all the steps pass'>
	self assert: result passedCount equals: 3
]

{ #category : #steps }
RunningScenarioFeature >> firstStepFails [

	<Given: 'the first step fails'>
	theScenario
		addStep: #Given text: 'a test step that fails';
		addStep: #When text: 'we run the test scenario';
		addStep: #Then text: 'the test scenario fails'
]

{ #category : #steps }
RunningScenarioFeature >> oneStepIsImplementedIncorrectly [

	<Given: 'one step is implemented incorrectly'>
	theScenario
		addStep: #Given text: 'a test scenario';
		addStep: #When text: 'we run the test scenario';
		addStep: #Then text: 'the test scenario fails'
]

{ #category : #steps }
RunningScenarioFeature >> oneStepIsMarkedAsFailed [

	<Then: 'one step is marked as failed'>
	self assert: result failedCount equals: 1.
	self assert: result failed first text equals: 'the test scenario fails'
]

{ #category : #steps }
RunningScenarioFeature >> oneStepIsMarkedAsUndefined [

	<Then: 'one step is marked as undefined'>
	self assert: result undefinedCount equals: 1.
	self
		assert: result undefined first text
		equals: 'a test scenario that is not defined'
]

{ #category : #steps }
RunningScenarioFeature >> oneStepIsStillMarkedAsFailed [

	<Then: 'one step is still marked as failed'>
	self assert: result failedCount equals: 1.
	self
		assert: result failed first text
		equals: 'the test scenario fails due to error'
]

{ #category : #steps }
RunningScenarioFeature >> oneStepIsUndefined [

	<Given: 'one step is undefined'>
	theScenario
		addStep: #Given text: 'a test scenario that is not defined';
		addStep: #When text: 'we run the test scenario';
		addStep: #Then text: 'the test scenario fails'
]

{ #category : #steps }
RunningScenarioFeature >> oneStepRaisesAnError [

	<Given: 'one step raises an error'>
	theScenario
		addStep: #Given text: 'a test scenario';
		addStep: #When text: 'we run the test scenario';
		addStep: #Then text: 'the test scenario fails due to error'
]

{ #category : #steps }
RunningScenarioFeature >> runTheScenario [

	<When: 'we run the scenario'>
	result := theScenario run
]

{ #category : #'steps - private' }
RunningScenarioFeature >> runTheTestScenario [

	<When: 'we run the test scenario'>
]

{ #category : #scenarios }
RunningScenarioFeature >> runningAScenario [

	<Scenario: 'Running a scenario'>
	self
		given: 'a simple scenario';
		given: 'all its steps are correctly implemented';
		when: 'we run the scenario';
		then: 'the scenario passes';
		then: 'all the steps pass'
]

{ #category : #scenarios }
RunningScenarioFeature >> scenarioError [

	<Scenario: 'Scenario raising error'>
	self
		given: 'a simple scenario';
		given: 'one step raises an error';
		when: 'we run the scenario';
		then: 'the scenario fails';
		then: 'one step is still marked as failed'
]

{ #category : #steps }
RunningScenarioFeature >> scenarioFails [

	<Then: 'the scenario fails'>
	self assert: result hasFailed
]

{ #category : #scenarios }
RunningScenarioFeature >> scenarioFailure [

	<Scenario: 'Failing Scenario'>
	self
		given: 'a simple scenario';
		given: 'one step is implemented incorrectly';
		when: 'we run the scenario';
		then: 'the scenario fails';
		then: 'one step is marked as failed'
]

{ #category : #steps }
RunningScenarioFeature >> scenarioPasses [

	<Then: 'the scenario passes'>
	self assert: result isPassed.
	self assert: result passedCount equals: 3
]

{ #category : #steps }
RunningScenarioFeature >> simpleScenario [

	<Given: 'a simple scenario'>
	theScenario := Scenario title: 'a scenario' feature: self
]

{ #category : #scenarios }
RunningScenarioFeature >> skippedSteps [

	<Scenario: 'Scenario with skipped steps'>
	self
		given: 'a simple scenario';
		given: 'the first step fails';
		when: 'we run the scenario';
		then: 'all remaining steps are marked as skipped'
]

{ #category : #'steps - private' }
RunningScenarioFeature >> stepThatFails [

	<Given: 'a test step that fails'>
	self assert: false
	
]

{ #category : #'steps - private' }
RunningScenarioFeature >> testScenario [

	<Given: 'a test scenario'>
]

{ #category : #'steps - private' }
RunningScenarioFeature >> testScenarioFails [

	<Then: 'the test scenario fails'>
	self assert: false
	
]

{ #category : #'steps - private' }
RunningScenarioFeature >> testScenarioFailsDueToError [

	<Then: 'the test scenario fails due to error'>
	self error: 'a step error'
]

{ #category : #'steps - private' }
RunningScenarioFeature >> testScenarioPasses [

	<Then: 'the test scenario passes'>
]

{ #category : #scenarios }
RunningScenarioFeature >> undefinedStep [

	<Scenario: 'Scenario with undefined step'>
	self
		given: 'a simple scenario';
		given: 'one step is undefined';
		when: 'we run the scenario';
		then: 'the scenario fails';
		then: 'one step is marked as undefined'
]
