rendering
renderFormsPanelOn: html
	"sliders - switch"
	html mdlTabsPanel
		id: 'forms';
		with: [ 
			html form: [ 
				html mdlTextFieldContainer expandable; with: [ 
					html mdlClickableIconContainer for: 'bigorneau'; with: [ 
						html mdlIcon: 'search' ].
					html mdlTextFieldExpandableHolder: [ 
						html mdlTextFieldInput id: 'bigorneau'; type: 'text'.
						html mdlTextFieldLabel for: 'bigorneau-expandable'; with: 'Expandable Input'  ] ].
				
				html heading level4 with: 'Text fields'.
				html mdlTextFieldContainer floatingLabel; with: [ 
					html mdlTextFieldLabel for: 'input_text'; with: 'First name'.
					html mdlTextFieldInput id: 'input_text'; type: 'text' ].
				html break.
				html mdlTextFieldContainer floatingLabel; with: [ 
					html mdlTextFieldLabel for: 'input_email'; with: 'Email'.
					html mdlTextFieldInput id: 'input_email'; type: 'email' ]. 
				html break.
				html mdlTextFieldContainer floatingLabel; with: [ 
					html mdlTextFieldLabel for: 'input_password'; with: 'Password'.
					html mdlTextFieldInput id: 'input_password'; type: 'password'; pattern: '[0-9]*'.
					html mdlTextFieldError: 'Digits only' ].
				html break.
					html mdlTextFieldContainer: [ 
						html mdlMultilineTextField rows: 3; id:'textArea'.
						html mdlTextFieldLabel for: 'textArea'; with: 'TextLines' ] .
				html break.
				html heading level4 with: 'Checkboxes and radio buttons'.
				html mdlCheckboxContainer for:'checkbox1'; with: [ 
					html mdlCheckbox id: 'checkbox1' ; value: true.
					html mdlCheckboxLabel: 'Checkbox' ].
				html break.
				html mdlRadioContainer for: 'radio1' ; with: [ 
					html mdlRadioButton id: 'radio1'; value:'1'; name: 'options'; beChecked.
					html mdlRadioLabel: 'Option 1' ].
				html space.
				html mdlRadioContainer for: 'radio2' ; with: [ 
					html mdlRadioButton id: 'radio2'; value:'2'; name: 'options'.
					html mdlRadioLabel: 'Option 2' ].
				html heading level4 with: 'Sliders'.
				html mdlSlider min:0; max: 10; value: 0.
				html break.
				html mdlSlider min:0; max: 100; value: 25 .
				html break.
			] 
		]