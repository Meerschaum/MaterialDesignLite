Class {
	#name : #MDLAjaxExpansionStrategy,
	#superclass : #MDLExpansionStrategy,
	#instVars : [
		'onFoldBlock',
		'onExpandBlock'
	],
	#category : #'Material-Design-Lite-Widgets-Expansion'
}

{ #category : #initialization }
MDLAjaxExpansionStrategy >> initialize [
	super initialize.
	self
		onFoldBlock: [ :expansionPanel :htmlCanvas | htmlCanvas jQuery noop ];
		onExpandBlock: [ :expansionPanel :htmlCanvas | htmlCanvas jQuery noop ]
]

{ #category : #accessing }
MDLAjaxExpansionStrategy >> onExpandBlock [
	^ onExpandBlock
]

{ #category : #accessing }
MDLAjaxExpansionStrategy >> onExpandBlock: anObject [
	onExpandBlock := anObject
]

{ #category : #accessing }
MDLAjaxExpansionStrategy >> onFoldBlock [
	^ onFoldBlock
]

{ #category : #accessing }
MDLAjaxExpansionStrategy >> onFoldBlock: anObject [
	onFoldBlock := anObject
]

{ #category : #rendering }
MDLAjaxExpansionStrategy >> renderExpansionPanel: anExpansionPanel contentOn: html [
	html div
		class: 'mdl-expansion-panel__content';
		with: [ anExpansionPanel isExpanded
				ifTrue: [ html mdlGrid
						with: [ html mdlCell
								size: 12;
								with: [ anExpansionPanel expandedBlock value: html ] ] ] ]
]

{ #category : #javascript }
MDLAjaxExpansionStrategy >> toggleScriptOn: html for: anExpansionPanel [
	^ html jQuery
		script: [ :jsScript | 
			anExpansionPanel isExpanded
				ifFalse: [ jsScript << (self onFoldBlock value: anExpansionPanel value: html) ]
				ifTrue: [ jsScript << (self onExpandBlock value: anExpansionPanel value: html) ].
			jsScript << (html jQuery id: anExpansionPanel id) parent load
				html: [ :ajaxHtmlCanvas | 
					anExpansionPanel toggleExpansion.
					ajaxHtmlCanvas render: anExpansionPanel ];

				onComplete:
					('componentHandler.upgradeElements($("#{1}"));'
						format: {anExpansionPanel id asString}) js ]
]