import assert from 'node:assert/strict';
import { createRequire } from 'node:module';
import path from 'node:path';
import test from 'node:test';

import { bin, core } from '@node-3d/deps-qt-gui';

const require = createRequire(import.meta.url);
const consumer = require('./build/Release/consumer.node') as {
	probe: (library: string) => boolean;
};

const getLibrary = (): string => {
	if (process.platform === 'win32') {
		return path.join(bin, 'Qt6Gui.dll');
	}
	if (process.platform === 'darwin') {
		return path.join(bin, 'QtGui.framework', 'Versions', 'A', 'QtGui');
	}
	return path.join(bin, 'libQt6Gui.so.6');
};

test('loads the packed Qt GUI runtime and its Core dependency', () => {
	assert.equal(typeof core.bin, 'string');
	assert.equal(consumer.probe(getLibrary()), true);
});
