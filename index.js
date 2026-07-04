import { getPaths } from '@node-3d/addon-tools';
import core from '@node-3d/deps-qt-core';

const paths = getPaths(import.meta.dirname);

export { default as core } from '@node-3d/deps-qt-core';

export const bin = paths.bin;
export const include = paths.include;

const depsQtGui = {
	core,
	...paths,
};

export default depsQtGui;
