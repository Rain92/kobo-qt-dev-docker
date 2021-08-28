import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "QmlModels"
    Depends { name: "Qt"; submodules: ["core-private", "qml-private", "qmlmodels"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: false
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: ""
    libNameForLinkerRelease: ""
    libFilePathDebug: ""
    libFilePathRelease: ""
    cpp.defines: []
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQmlModels/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtQmlModels/5.14.1/QtQmlModels"]
    cpp.libraryPaths: []
    
}
