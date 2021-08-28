import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "QuickShapes"
    Depends { name: "Qt"; submodules: ["core", "gui-private", "qml", "quick-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Quick.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5QuickShapes"
    libNameForLinkerRelease: "Qt5QuickShapes"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5QuickShapes.so.5.14.1"
    cpp.defines: ["QT_QUICKSHAPES_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQuickShapes", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQuickShapes/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQuickShapes/5.14.1/QtQuickShapes"]
    cpp.libraryPaths: []
    Group {
        files: [Qt["quickshapes-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
