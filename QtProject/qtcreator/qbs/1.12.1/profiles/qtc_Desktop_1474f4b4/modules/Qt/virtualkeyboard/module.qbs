import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "VirtualKeyboard"
    Depends { name: "Qt"; submodules: ["core", "gui", "qml", "quick"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["xcb", "xcb-xfixes", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Quick.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5VirtualKeyboard"
    libNameForLinkerRelease: "Qt5VirtualKeyboard"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5VirtualKeyboard.so.5.14.1"
    cpp.defines: ["QT_VIRTUALKEYBOARD_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtVirtualKeyboard"]
    cpp.libraryPaths: []
    Group {
        files: [Qt["virtualkeyboard"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
