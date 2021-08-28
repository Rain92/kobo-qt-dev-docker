import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "EdidSupport"
    Depends { name: "Qt"; submodules: ["core-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Core.so"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5EdidSupport"
    libNameForLinkerRelease: "Qt5EdidSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5EdidSupport.a"
    cpp.defines: ["QT_EDID_SUPPORT_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtEdidSupport", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtEdidSupport/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtEdidSupport/5.14.1/QtEdidSupport"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["edid_support-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
