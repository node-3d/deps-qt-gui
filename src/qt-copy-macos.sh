# $1 is tmp path - ${{ github.workspace }}/../__tmp
# $2 is Qt platform path - /home/opc/6.8.0/gcc_arm64

# Gui
mkdir -p $1/QtGui.framework
mkdir -p $1/QtGui.framework/Versions
mkdir -p $1/QtGui.framework/Versions/Current
cp $2/lib/QtGui.framework/Versions/Current/QtGui $1/QtGui.framework/Versions/Current/QtGui

mkdir -p $1/QtOpenGL.framework
mkdir -p $1/QtOpenGL.framework/Versions
mkdir -p $1/QtOpenGL.framework/Versions/Current
cp $2/lib/QtOpenGL.framework/Versions/Current/QtOpenGL $1/QtOpenGL.framework/Versions/Current/QtOpenGL

mkdir -p $1/QtSvg.framework
mkdir -p $1/QtSvg.framework/Versions
mkdir -p $1/QtSvg.framework/Versions/Current
cp $2/lib/QtSvg.framework/Versions/Current/QtSvg $1/QtSvg.framework/Versions/Current/QtSvg

mkdir -p $1/QtWidgets.framework
mkdir -p $1/QtWidgets.framework/Versions
mkdir -p $1/QtWidgets.framework/Versions/Current
cp $2/lib/QtWidgets.framework/Versions/Current/QtWidgets $1/QtWidgets.framework/Versions/Current/QtWidgets

cp $2/plugins/iconengines/libqsvgicon.dylib $1/plugins/iconengines/libqsvgicon.dylib
cp $2/plugins/imageformats/libqgif.dylib $1/plugins/imageformats/libqgif.dylib
cp $2/plugins/imageformats/libqico.dylib $1/plugins/imageformats/libqico.dylib
cp $2/plugins/imageformats/libqjpeg.dylib $1/plugins/imageformats/libqjpeg.dylib
cp $2/plugins/imageformats/libqsvg.dylib $1/plugins/imageformats/libqsvg.dylib
cp $2/plugins/platforms/libqcocoa.dylib $1/plugins/platforms/libqcocoa.dylib
cp $2/plugins/platforms/libqoffscreen.dylib $1/plugins/platforms/libqoffscreen.dylib

for framework in "$1"/*.framework; do
	name="$(basename "$framework" .framework)"
	current="$framework/Versions/Current/$name"
	version_a="$framework/Versions/A/$name"

	if [ -f "$current" ] && [ ! -f "$version_a" ]; then
		mkdir -p "$framework/Versions/A"
		cp "$current" "$version_a"
	fi
done
