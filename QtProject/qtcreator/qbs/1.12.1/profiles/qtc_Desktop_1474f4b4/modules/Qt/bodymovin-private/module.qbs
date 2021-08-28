import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "Bodymovin"
    Depends { name: "Qt"; submodules: ["core", "gui", "gui-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Gui.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5Bodymovin"
    libNameForLinkerRelease: "Qt5Bodymovin"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Bodymovin.so.5.14.1"
    cpp.defines: ["QT_BODYMOVIN_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtBodymovin", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtBodymovin/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtBodymovin/5.14.1/QtBodymovin"]
    cpp.libraryPaths: []
    Group {
        files: [Qt["bodymovin-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
