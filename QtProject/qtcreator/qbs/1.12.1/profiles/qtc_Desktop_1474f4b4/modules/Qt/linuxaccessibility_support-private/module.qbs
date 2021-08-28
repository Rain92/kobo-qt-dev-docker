import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "LinuxAccessibilitySupport"
    Depends { name: "Qt"; submodules: ["core-private", "dbus", "gui-private", "accessibility_support-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5DBus.so"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5LinuxAccessibilitySupport"
    libNameForLinkerRelease: "Qt5LinuxAccessibilitySupport"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5LinuxAccessibilitySupport.a"
    cpp.defines: ["QT_LINUXACCESSIBILITY_SUPPORT_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtLinuxAccessibilitySupport", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtLinuxAccessibilitySupport/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtLinuxAccessibilitySupport/5.14.1/QtLinuxAccessibilitySupport"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["linuxaccessibility_support-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
