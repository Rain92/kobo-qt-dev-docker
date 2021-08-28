import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "RemoteObjects"
    Depends { name: "Qt"; submodules: ["core", "network"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Network.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5RemoteObjects"
    libNameForLinkerRelease: "Qt5RemoteObjects"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5RemoteObjects.so.5.14.1"
    cpp.defines: ["QT_REMOTEOBJECTS_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtRemoteObjects"]
    cpp.libraryPaths: []
    Group {
        files: [Qt["remoteobjects"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
