magritte descriptions
nameDescription
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Name';
		accessor: #name;
		beRequired;
		requiredErrorMessage: 'We cannot proceed without a name.';
		comment: 'Please enter your name';
		componentClass: MDLMATextInputComponent; "is required for placeholder text below"
		placeholder: 'your name';
		yourself