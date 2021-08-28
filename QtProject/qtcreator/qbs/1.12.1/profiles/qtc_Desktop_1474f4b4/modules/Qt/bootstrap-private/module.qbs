import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "Bootstrap"
    Depends { name: "Qt"; submodules: []}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["pthread"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5Bootstrap"
    libNameForLinkerRelease: "Qt5Bootstrap"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Bootstrap.a"
    cpp.defines: ["QT_BOOTSTRAP_LIB", "QT_VERSION_STR=\\'\\\"5.14.1\\\"\\'", "QT_VERSION_MAJOR=5", "QT_VERSION_MINOR=14", "QT_VERSION_PATCH=1", "QT_BOOTSTRAPPED", "QT_NO_CAST_TO_ASCII"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtCore", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtCore/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtCore/5.14.1/QtCore", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtXml", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtXml/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtXml/5.14.1/QtXml"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["bootstrap-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
