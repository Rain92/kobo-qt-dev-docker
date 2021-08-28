import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "KmsSupport"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Gui.so", "drm", "dl"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5KmsSupport"
    libNameForLinkerRelease: "Qt5KmsSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5KmsSupport.a"
    cpp.defines: ["QT_KMS_SUPPORT_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtKmsSupport", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtKmsSupport/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtKmsSupport/5.14.1/QtKmsSupport"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["kms_support-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
