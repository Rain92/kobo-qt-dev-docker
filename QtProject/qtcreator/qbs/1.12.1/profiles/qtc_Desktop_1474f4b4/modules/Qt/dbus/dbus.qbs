import qbs 1.0
import qbs.FileInfo
import qbs.ModUtils
import "../QtModule.qbs" as QtModule
import "dbus.js" as DBus

QtModule {
    qtModuleName: "DBus"

    property string xml2cppName: "qdbusxml2cpp"
    property stringList xml2CppHeaderFlags: []
    property stringList xml2CppSourceFlags: []

    Rule {
        inputs: ["qt.dbus.adaptor"]

        Artifact {
            filePath: FileInfo.joinPaths(input.moduleProperty("Qt.core", "generatedHeadersDir"),
                                         DBus.outputFileName(input, "_adaptor.h"))
            fileTags: ["hpp"]
        }
        Artifact {
            filePath: DBus.outputFileName(input, "_adaptor.cpp")
            fileTags: ["cpp"]
        }

        prepare: {
            return DBus.createCommands(product, input, outputs, "-a");
        }
    }

    Rule {
        inputs: ["qt.dbus.interface"]

        Artifact {
            filePath: FileInfo.joinPaths(input.moduleProperty("Qt.core", "generatedHeadersDir"),
                                         DBus.outputFileName(input, "_interface.h"))
            fileTags: ["hpp"]
        }
        Artifact {
            filePath: DBus.outputFileName(input, "_interface.cpp")
            fileTags: ["cpp"]
        }

        prepare: {
            return DBus.createCommands(product, input, outputs, "-p");
        }
    }

    architectures: ["x86_64"]
    targetPlatform: "linux"
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/home/user/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Core.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5DBus"
    libNameForLinkerRelease: "Qt5DBus"
    libFilePathDebug: ""
    libFilePathRelease: "/home/user/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5DBus.so.5.14.1"

    cpp.defines: ["QT_DBUS_LIB"]
    cpp.includePaths: ["/home/user/qt-bin/qt-linux-5.14.1-desktop/include", "/home/user/qt-bin/qt-linux-5.14.1-desktop/include/QtDBus"]
    cpp.libraryPaths: []

    Group {
        files: [Qt["dbus"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}

