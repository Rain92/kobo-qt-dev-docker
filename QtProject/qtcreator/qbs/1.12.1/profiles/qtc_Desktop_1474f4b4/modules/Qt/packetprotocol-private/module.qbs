import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "PacketProtocol"
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
    libNameForLinkerDebug: "Qt5PacketProtocol"
    libNameForLinkerRelease: "Qt5PacketProtocol"
    libFilePathDebug: ""
    libFilePathRelease: "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5PacketProtocol.a"
    cpp.defines: ["QT_PACKETPROTOCOL_LIB"]
    cpp.includePaths: ["/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtPacketProtocol", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtPacketProtocol/5.14.1", "/home/andreas/qt-bin/qt-linux-5.14.1-desktop/include/QtPacketProtocol/5.14.1/QtPacketProtocol"]
    cpp.libraryPaths: []
    isStaticLibrary: true
Group {
        files: [Qt["packetprotocol-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["staticlibrary"]
    }
}
