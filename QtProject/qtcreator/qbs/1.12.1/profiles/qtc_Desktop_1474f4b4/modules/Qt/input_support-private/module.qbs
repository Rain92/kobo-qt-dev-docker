import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "InputSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private", "devicediscovery_support-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Gui.so"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5InputSupport"
    libNameForLinkerRelease: "Qt5InputSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5InputSupport.a"
    cpp.defines: ["QT_INPUT_SUPPORT_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtInputSupport", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtInputSupport/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtInputSupport/5.14.1/QtInputSupport"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["input_support-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
