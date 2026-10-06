{
	'targets': [{
		'target_name': 'consumer',
		'sources': ['consumer.cpp'],
		'conditions': [
			['OS=="linux"', { 'libraries': ['-ldl'] }],
		],
	}],
}
