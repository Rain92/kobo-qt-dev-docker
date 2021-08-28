import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "ThemeSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Gui.so", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5DBus.so"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5ThemeSupport"
    libNameForLinkerRelease: "Qt5ThemeSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5ThemeSupport.a"
    cpp.defines: ["QT_THEME_SUPPORT_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtThemeSupport", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtThemeSupport/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtThemeSupport/5.14.1/QtThemeSupport"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["theme_support-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
