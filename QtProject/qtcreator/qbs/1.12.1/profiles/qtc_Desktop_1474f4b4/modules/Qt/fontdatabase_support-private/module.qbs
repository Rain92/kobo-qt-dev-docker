import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "FontDatabaseSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Gui.so", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libqtfreetype.a", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libqtlibpng.a"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5FontDatabaseSupport"
    libNameForLinkerRelease: "Qt5FontDatabaseSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5FontDatabaseSupport.a"
    cpp.defines: ["QT_FONTDATABASE_SUPPORT_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtFontDatabaseSupport", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtFontDatabaseSupport/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtFontDatabaseSupport/5.14.1/QtFontDatabaseSupport"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["fontdatabase_support-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
