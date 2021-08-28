import qbs 1.0
import qbs.FileInfo
import qbs.Utilities
import "../QtModule.qbs" as QtModule

QtModule {
    qtModuleName: "Scxml"

    property string qscxmlcName: "qscxmlc"
    property string className
    property string namespace
    property bool generateStateMethods
    property stringList additionalCompilerFlags

    Rule {
        inputs: ["qt.scxml.compilable"]

        Artifact {
            filePath: FileInfo.joinPaths(input.moduleProperty("Qt.core", "generatedHeadersDir"),
                                         input.baseName + ".h")
            fileTags: ["hpp", "unmocable"]
        }
        Artifact {
            filePath: input.baseName + ".cpp"
            fileTags: ["cpp"]
        }

        prepare: {
            var compilerName = product.moduleProperty("Qt.scxml", "qscxmlcName");
            var compilerPath = FileInfo.joinPaths(input.moduleProperty("Qt.core", "binPath"),
                                                  compilerName);
            var args = ["--header", outputs["hpp"][0].filePath,
                        "--impl", outputs["cpp"][0].filePath];
            var cxx98 = input.moduleProperty("cpp", "cxxLanguageVersion") === "c++98";
            if (cxx98)
                args.push("-no-c++11");
            var className = input.moduleProperty("Qt.scxml", "className");
            if (className)
                args.push("--classname", className);
            var namespace = input.moduleProperty("Qt.scxml", "namespace");
            if (namespace)
                args.push("--namespace", namespace);
            if (input.Qt.scxml.generateStateMethods
                    && Utilities.versionCompare(product.Qt.scxml.version, "5.9") >= 0) {
                args.push("--statemethods");
            }
            if (input.Qt.scxml.additionalCompilerFlags)
                args = args.concat(input.Qt.scxml.additionalCompilerFlags);
            args.push(input.filePath);
            var cmd = new Command(compilerPath, args);
            cmd.description = "compiling " + input.fileName;
            cmd.highlight = "codegen";
            return [cmd];
        }
    }

    architectures: ["x86_64"]
    targetPlatform: "linux"
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/home/user/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Qml.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5Scxml"
    libNameForLinkerRelease: "Qt5Scxml"
    libFilePathDebug: ""
    libFilePathRelease: "/home/user/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Scxml.so.5.14.1"

    cpp.defines: ["QT_SCXML_LIB"]
    cpp.includePaths: ["/home/user/qt-bin/qt-linux-5.14.1-desktop/include", "/home/user/qt-bin/qt-linux-5.14.1-desktop/include/QtScxml"]
    cpp.libraryPaths: []

    Group {
        files: [Qt["scxml"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
