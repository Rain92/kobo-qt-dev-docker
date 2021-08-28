import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "QmlDebug"
    Depends { name: "Qt"; submodules: ["core-private", "network", "packetprotocol-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Network.so"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5QmlDebug"
    libNameForLinkerRelease: "Qt5QmlDebug"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5QmlDebug.a"
    cpp.defines: ["QT_QMLDEBUG_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQmlDebug", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQmlDebug/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQmlDebug/5.14.1/QtQmlDebug"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["qmldebug-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
