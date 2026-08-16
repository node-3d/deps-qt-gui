# $1 is tmp path - ${{ github.workspace }}/../__tmp
# $2 is Qt platform path - /home/opc/6.8.0/gcc_arm64

mkdir -p $1/plugins/xcbglintegrations

# Gui
cp $2/lib/libQt6Gui.so.6 $1/libQt6Gui.so.6
cp $2/lib/libQt6OpenGL.so.6 $1/libQt6OpenGL.so.6
cp $2/lib/libQt6Svg.so.6 $1/libQt6Svg.so.6
cp $2/lib/libQt6Widgets.so.6 $1/libQt6Widgets.so.6
cp $2/lib/libQt6XcbQpa.so.6 $1/libQt6XcbQpa.so.6
cp $2/lib/libQt6WaylandClient.so.6 $1/libQt6WaylandClient.so.6
cp $2/lib/libQt6WaylandEglClientHwIntegration.so.6 $1/libQt6WaylandEglClientHwIntegration.so.6


cp $2/plugins/iconengines/libqsvgicon.so $1/plugins/iconengines/libqsvgicon.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/iconengines/libqsvgicon.so

cp $2/plugins/imageformats/libqgif.so $1/plugins/imageformats/libqgif.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/imageformats/libqgif.so

cp $2/plugins/imageformats/libqico.so $1/plugins/imageformats/libqico.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/imageformats/libqico.so

cp $2/plugins/imageformats/libqjpeg.so $1/plugins/imageformats/libqjpeg.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/imageformats/libqjpeg.so

cp $2/plugins/imageformats/libqsvg.so $1/plugins/imageformats/libqsvg.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/imageformats/libqsvg.so

cp $2/plugins/platforms/libqlinuxfb.so $1/plugins/platforms/libqlinuxfb.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/platforms/libqlinuxfb.so

cp $2/plugins/platforms/libqoffscreen.so $1/plugins/platforms/libqoffscreen.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/platforms/libqoffscreen.so

cp $2/plugins/platforms/libqwayland-generic.so $1/plugins/platforms/libqwayland-generic.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/platforms/libqwayland-generic.so

cp $2/plugins/platforms/libqwayland-egl.so $1/plugins/platforms/libqwayland-egl.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/platforms/libqwayland-egl.so

cp $2/plugins/platforms/libqxcb.so $1/plugins/platforms/libqxcb.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/platforms/libqxcb.so

cp $2/plugins/xcbglintegrations/libqxcb-egl-integration.so $1/plugins/xcbglintegrations/libqxcb-egl-integration.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/xcbglintegrations/libqxcb-egl-integration.so

cp $2/plugins/xcbglintegrations/libqxcb-glx-integration.so $1/plugins/xcbglintegrations/libqxcb-glx-integration.so
patchelf --force-rpath --set-rpath '$$ORIGIN/../..' $1/plugins/xcbglintegrations/libqxcb-glx-integration.so
