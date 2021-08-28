import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "MultimediaQuick"
    Depends { name: "Qt"; submodules: ["core", "quick", "multimedia-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Quick.so", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Multimedia.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5MultimediaQuick"
    libNameForLinkerRelease: "Qt5MultimediaQuick"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5MultimediaQuick.so.5.14.1"
    cpp.defines: ["QT_QTMULTIMEDIAQUICKTOOLS_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtMultimediaQuick", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtMultimediaQuick/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtMultimediaQuick/5.14.1/QtMultimediaQuick"]
    cpp.libraryPaths: []
    Group {
        files: [Qt["qtmultimediaquicktools-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
