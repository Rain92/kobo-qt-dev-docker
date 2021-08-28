import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "XkbCommonSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Gui.so", "xkbcommon"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5XkbCommonSupport"
    libNameForLinkerRelease: "Qt5XkbCommonSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5XkbCommonSupport.a"
    cpp.defines: ["QT_XKBCOMMON_SUPPORT_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtXkbCommonSupport", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtXkbCommonSupport/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtXkbCommonSupport/5.14.1/QtXkbCommonSupport"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["xkbcommon_support-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
