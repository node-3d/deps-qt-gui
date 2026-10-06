{
	'variables': {
		'bin': '<!(node -p "require(\'@node-3d/addon-tools\').getBin()")',
	},
	'targets': [{
		'target_name': 'consumer',
		'sources': ['consumer.cpp'],
		'conditions': [
			['OS=="linux"', {
				'libraries': ['-ldl'],
				'ldflags': [
					'-Wl,--disable-new-dtags',
					"-Wl,-rpath,'$$ORIGIN/../../node_modules/@node-3d/deps-qt-core/<(bin):$$ORIGIN/../../node_modules/@node-3d/deps-qt-gui/<(bin)'",
				],
			}],
			['OS=="mac"', {
				'libraries': [
					'-Wl,-rpath,@loader_path/../../node_modules/@node-3d/deps-qt-core/<(bin)',
					'-Wl,-rpath,@loader_path/../../node_modules/@node-3d/deps-qt-gui/<(bin)',
				],
			}],
		],
	}],
}
