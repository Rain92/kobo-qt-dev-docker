import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "QuickTest"
    Depends { name: "Qt"; submodules: ["core", "testlib", "widgets"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Test.so", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Widgets.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5QuickTest"
    libNameForLinkerRelease: "Qt5QuickTest"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5QuickTest.so.5.14.1"
    cpp.defines: ["QT_QMLTEST_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQuickTest"]
    cpp.libraryPaths: []
    Group {
        files: [Qt["qmltest"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
