Extension { #name : #ScenarioResult }

{ #category : #'*Scenarios-Tools' }
ScenarioResult >> inspectionFailed: aBuilder [
	<inspectorPresentationOrder: 1 title: 'Failed'>

	^ aBuilder newTable
		addColumn: (SpIndexTableColumn new
			title: 'Index';
			sortFunction: #yourself ascending;
			beNotExpandable;
			yourself);
		addColumn: (SpImageTableColumn new
				evaluated: #icon;
				beNotExpandable;
				yourself);
		addColumn: (SpStringTableColumn new
			title: 'Value';
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ];
			sortFunction: #printString ascending;
			yourself);
		items: failed asOrderedCollection;
		yourself
]

{ #category : #'*Scenarios-Tools' }
ScenarioResult >> inspectionPassed: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Passed'>

	^ aBuilder newTable
		addColumn: (SpIndexTableColumn new
			title: 'Index';
			sortFunction: #yourself ascending;
			beNotExpandable;
			yourself);
		addColumn: (SpImageTableColumn new
				evaluated: #icon;
				beNotExpandable;
				yourself);
		addColumn: (SpStringTableColumn new
			title: 'Value';
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ];
			sortFunction: #printString ascending;
			yourself);
		items: passed asOrderedCollection;
		yourself
]

{ #category : #'*Scenarios-Tools' }
ScenarioResult >> inspectionUndefined: aBuilder [
	<inspectorPresentationOrder: 2 title: 'Undefined'>

	^ aBuilder newTable
		addColumn: (SpIndexTableColumn new
			title: 'Index';
			sortFunction: #yourself ascending;
			beNotExpandable;
			yourself);
		addColumn: (SpImageTableColumn new
				evaluated: #icon;
				beNotExpandable;
				yourself);
		addColumn: (SpStringTableColumn new
			title: 'Value';
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ];
			sortFunction: #printString ascending;
			yourself);
		items: undefined asOrderedCollection;
		yourself
]