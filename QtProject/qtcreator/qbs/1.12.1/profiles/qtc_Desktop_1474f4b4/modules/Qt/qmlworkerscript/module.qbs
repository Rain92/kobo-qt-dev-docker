import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "QmlWorkerScript"
    Depends { name: "Qt"; submodules: ["core", "qml"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Qml.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5QmlWorkerScript"
    libNameForLinkerRelease: "Qt5QmlWorkerScript"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5QmlWorkerScript.so.5.14.1"
    cpp.defines: ["QT_QMLWORKERSCRIPT_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQmlWorkerScript"]
    cpp.libraryPaths: []
    Group {
        files: [Qt["qmlworkerscript"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
