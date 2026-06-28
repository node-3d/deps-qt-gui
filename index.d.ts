import type { getPaths } from '@node-3d/addon-tools';
import type depsQtCore from '@node-3d/deps-qt-core';

type AddonPaths = ReturnType<typeof getPaths>;

export declare const core: typeof depsQtCore;
export declare const bin: AddonPaths['bin'];
export declare const include: AddonPaths['include'];

declare const depsQtGui: AddonPaths & {
	core: typeof depsQtCore;
};
export default depsQtGui;
