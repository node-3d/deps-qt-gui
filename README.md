# Qt Gui binaries

This is a part of [Node3D](https://github.com/node-3d) project.

[![NPM](https://badge.fury.io/js/@node-3d%2Fdeps-qt-gui.svg)](https://badge.fury.io/js/@node-3d/deps-qt-gui)
[![Lint](https://github.com/node-3d/deps-qt-gui/actions/workflows/lint.yml/badge.svg)](https://github.com/node-3d/deps-qt-gui/actions/workflows/lint.yml)
[![Test](https://github.com/node-3d/deps-qt-gui/actions/workflows/test.yml/badge.svg)](https://github.com/node-3d/deps-qt-gui/actions/workflows/test.yml)

```console
npm install @node-3d/deps-qt-gui
```

## Binary Provenance

Release binary archives for this package are published by public GitHub Actions
workflows.
When a release asset includes a GitHub Artifact Attestation, you can verify that
the downloaded archive was published by the visible workflow in this repository:

```console
gh release download <tag> -R node-3d/deps-qt-gui -p <platform>.gz
gh attestation verify <platform>.gz -R node-3d/deps-qt-gui
```

The attestation links the archive to the repository, workflow, commit, and
release build identity. It does not replace review of the source code, workflow,
or third-party library contents.

This dependency package distributes **Qt Gui 6.8.0**
binaries through **npm** for **Node.js** addons.

* Platforms: Windows x64, Linux x64/ARM64, macOS ARM64.
* Libraries: Qt Gui.
* Linking: dynamic dll-type.


### Windows

Before any import of Qt-dependent module, there should be `require('@node-3d/deps-qt-gui')`.
On Windows it adds Qt's DLL location to ENV PATH. On Unix it does nothing.


### Unix

On Unix, **special** runtime library directories are not in ENV PATH. The paths
to such directories have to be compiled into the node-addon with `rpath` option.

Adjust `binding.gyp`:

```javascript
  'variables': {
    'bin': '<!(node -p "require(\'@node-3d/addon-tools\').bin")',
    'qt_core_bin': '<!(node -p "require(\'@node-3d/deps-qt-core\').bin")',
    'qt_gui_bin': '<!(node -p "require(\'@node-3d/deps-qt-gui\').bin")',
  },
  ...
  'targets': [
    {
      'target_name': '...',
      
      'conditions': [
        
        ['OS=="linux"', {
          'libraries': [
            "-Wl,-rpath,'$$ORIGIN'",
            "-Wl,-rpath,'$$ORIGIN/../node_modules/@node-3d/deps-qt-core/<(bin)'",
            "-Wl,-rpath,'$$ORIGIN/../node_modules/@node-3d/deps-qt-gui/<(bin)'",
            "-Wl,-rpath,'$$ORIGIN/../../@node-3d/deps-qt-core/<(bin)'",
            "-Wl,-rpath,'$$ORIGIN/../../@node-3d/deps-qt-gui/<(bin)'",
            '<(qt_core_bin)/libicui18n.so.73',
            '<(qt_core_bin)/libicuuc.so.73',
            '<(qt_core_bin)/libicudata.so.73',
            '<(qt_core_bin)/libicuio.so.73',
            '<(qt_core_bin)/libicule.so.73',
            '<(qt_core_bin)/libicutu.so.73',
            '<(qt_core_bin)/libQt6Core.so.6',
            '<(qt_core_bin)/libQt6Network.so.6',
            '<(qt_core_bin)/libQt6DBus.so.6',
            '<(qt_gui_bin)/libQt6Gui.so.6',
            '<(qt_gui_bin)/libQt6OpenGL.so.6',
            '<(qt_gui_bin)/libQt6Widgets.so.6',
            '<(qt_gui_bin)/libQt6XcbQpa.so.6',
          ],
        }],
        
        ['OS=="mac"', {
          'libraries': [
            '-Wl,-rpath,@loader_path',
            '-Wl,-rpath,@loader_path/../node_modules/@node-3d/deps-qt-core/<(bin)',
            '-Wl,-rpath,@loader_path/../node_modules/@node-3d/deps-qt-gui/<(bin)',
            '-Wl,-rpath,@loader_path/../../@node-3d/deps-qt-core/<(bin)',
            '-Wl,-rpath,@loader_path/../../@node-3d/deps-qt-gui/<(bin)',
          ],
        }],
        
      ],
      
    },
```


Preload libraries:

```cpp
#ifndef WIN32
	#include <dlfcn.h>
#endif
	
	// ... inside some kind of init() function
	#ifdef __linux__
	dlopen("libicui18n.so.73", RTLD_LAZY);
	dlopen("libicuuc.so.73", RTLD_LAZY);
	dlopen("libicudata.so.73", RTLD_LAZY);
	dlopen("libicuio.so.73", RTLD_LAZY);
	dlopen("libicule.so.73", RTLD_LAZY);
	dlopen("libicutu.so.73", RTLD_LAZY);
	dlopen("libQt6Core.so.6", RTLD_LAZY);
	dlopen("libQt6Network.so.6", RTLD_LAZY);
	dlopen("libQt6DBus.so.6", RTLD_LAZY);
	dlopen("libQt6Gui.so.6", RTLD_LAZY);
	dlopen("libQt6OpenGL.so.6", RTLD_LAZY);
	dlopen("libQt6Widgets.so.6", RTLD_LAZY);
	dlopen("libQt6XcbQpa.so.6", RTLD_LAZY);
	#endif
```


## Legal notice

This software uses the [Qt library](https://www.qt.io/).
Qt is legally used under the LGPLv3 (GNU Lesser General Public License) version.
It is [explicitly stated](https://www.qt.io/licensing/open-source-lgpl-obligations)
that Qt Libraries can be used in a commercial closed-source app (if you wish):

> In case of dynamic linking, it is possible, but not mandatory,
to keep application source code proprietary as long as it is
“work that uses the library” – typically achieved
via dynamic linking of the library.

These **terms and conditions** allow using (unmodified) Qt as a
shared library (DLL), in a closed-source project.

Qt licensing information (a copy) is given in a [separate file](QT_LGPL),
which also can be found on
[Qt's official web-site](http://doc.qt.io/qt-6/lgpl.html).

The binaries were extracted from installed copy of the framework.

---

The rest of this package is MIT licensed.
