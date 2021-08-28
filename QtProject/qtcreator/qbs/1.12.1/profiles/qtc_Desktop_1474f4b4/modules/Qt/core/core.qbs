import qbs 1.0
import qbs.FileInfo
import qbs.ModUtils
import qbs.TextFile
import qbs.Utilities
import qbs.Xml
import "moc.js" as Moc
import "qdoc.js" as Qdoc

Module {
    condition: (qbs.targetPlatform === targetPlatform || isCombinedUIKitBuild)
               && (!qbs.architecture
                   || architectures.length === 0
                   || architectures.contains(qbs.architecture))

    readonly property bool isCombinedUIKitBuild: ["ios", "tvos", "watchos"].contains(targetPlatform)
        && ["x86", "x86_64"].contains(qbs.architecture)
        && qbs.targetPlatform === targetPlatform + "-simulator"

    Depends { name: "cpp" }

    version: "5.14.1"
    property stringList architectures: ["x86_64"]
    property string targetPlatform: "linux"
    property string libInfix: ""
    property stringList config: ["file_copies", "qmake_use", "qt", "warn_on", "release", "link_prl", "incremental", "shared", "shared", "release", "linux", "unix", "posix", "gcc"]
    property stringList qtConfig: ["shared", "shared", "rpath", "release", "c++11", "c++14", "c++1z", "concurrent", "dbus", "reduce_exports", "reduce_relocations", "stl", "properties", "animation", "textcodec", "big_codecs", "clock-monotonic", "codecs", "itemmodel", "proxymodel", "concatenatetablesproxymodel", "textdate", "datestring", "doubleconversion", "eventfd", "filesystemiterator", "filesystemwatcher", "gestures", "glib", "identityproxymodel", "inotify", "library", "mimetype", "process", "statemachine", "regularexpression", "settings", "sharedmemory", "sortfilterproxymodel", "stringlistmodel", "systemsemaphore", "temporaryfile", "threadsafe-cloexec", "translation", "transposeproxymodel", "xmlstream", "xmlstreamreader", "xmlstreamwriter", "accessibility", "accessibility-atspi-bridge", "action", "clipboard", "colornames", "cssparser", "cursor", "desktopservices", "imageformat_xpm", "draganddrop", "freetype", "imageformatplugin", "harfbuzz", "highdpiscaling", "ico", "im", "image_heuristic_mask", "image_text", "imageformat_bmp", "imageformat_jpeg", "imageformat_png", "imageformat_ppm", "imageformat_xbm", "kms", "movie", "pdf", "picture", "sessionmanager", "shortcut", "standarditemmodel", "systemtrayicon", "tabletevent", "texthtmlparser", "textodfwriter", "validator", "whatsthis", "wheelevent", "networkinterface", "bearermanagement", "openssl", "udpsocket", "ftp", "getifaddrs", "http", "ipv6ifname", "localserver", "networkdiskcache", "networkproxy", "socks5", "ssl", "printer", "printdialog", "printpreviewwidget", "printpreviewdialog", "groupbox", "buttongroup", "menu", "lineedit", "spinbox", "slider", "scrollbar", "scrollarea", "itemviews", "tableview", "toolbutton", "calendarwidget", "colordialog", "listview", "columnview", "combobox", "completer", "contextmenu", "datawidgetmapper", "datetimeedit", "dial", "filesystemmodel", "dirmodel", "resizehandler", "mainwindow", "dockwidget", "textedit", "errormessage", "splitter", "stackedwidget", "treeview", "filedialog", "fontcombobox", "fontdialog", "fscompleter", "graphicsview", "graphicseffect", "inputdialog", "keysequenceedit", "lcdnumber", "listwidget", "mdiarea", "menubar", "messagebox", "progressbar", "progressdialog", "rubberband", "sizegrip", "splashscreen", "statusbar", "statustip", "style-stylesheet", "syntaxhighlighter", "tabbar", "tablewidget", "tabwidget", "textbrowser", "toolbar", "toolbox", "tooltip", "treewidget", "undocommand", "undostack", "undogroup", "undoview", "wizard", "dom"]
    property path binPath: "/home/user/qt-bin/qt-linux-5.14.1-desktop/bin"
    property path incPath: "/home/user/qt-bin/qt-linux-5.14.1-desktop/include"
    property path libPath: "/home/user/qt-bin/qt-linux-5.14.1-desktop/lib"
    property path pluginPath: "/home/user/qt-bin/qt-linux-5.14.1-desktop/plugins"
    property string mkspecName: "linux-g++"
    property path mkspecPath: "/home/user/qt-bin/qt-linux-5.14.1-desktop/mkspecs/linux-g++"
    property string mocName: "moc"
    property stringList mocFlags: []
    property string lreleaseName: "lrelease"
    property string qdocName: versionMajor >= 5 ? "qdoc" : "qdoc3"
    property stringList qdocEnvironment
    property path docPath: "/home/user/qt-bin/qt-linux-5.14.1-desktop/doc"
    property stringList helpGeneratorArgs: versionMajor >= 5 ? ["-platform", "minimal"] : []
    property var versionParts: version ? version.split('.').map(function(item) { return parseInt(item, 10); }) : []
    property int versionMajor: versionParts[0]
    property int versionMinor: versionParts[1]
    property int versionPatch: versionParts[2]
    property bool frameworkBuild: false
    property bool staticBuild: false
    property stringList pluginMetaData: []
    property bool enableKeywords: true

    property stringList availableBuildVariants: ["release"]
    property string qtBuildVariant: {
        if (availableBuildVariants.contains(qbs.buildVariant))
            return qbs.buildVariant;
        return availableBuildVariants.length > 0 ? availableBuildVariants[0] : "";
    }

    property stringList staticLibsDebug: []
    property stringList staticLibsRelease: []
    property stringList dynamicLibsDebug: []
    property stringList dynamicLibsRelease: ["pthread"]
    property stringList staticLibs: qtBuildVariant === "debug"
                                    ? staticLibsDebug : staticLibsRelease
    property stringList dynamicLibs: qtBuildVariant === "debug"
                                    ? dynamicLibsDebug : dynamicLibsRelease
    property stringList linkerFlagsDebug: []
    property stringList linkerFlagsRelease: []
    property stringList coreLinkerFlags: qtBuildVariant === "debug"
                                    ? linkerFlagsDebug : linkerFlagsRelease
    property stringList frameworksDebug: []
    property stringList frameworksRelease: []
    property stringList coreFrameworks: qtBuildVariant === "debug"
            ? frameworksDebug : frameworksRelease
    property stringList frameworkPathsDebug: []
    property stringList frameworkPathsRelease: []
    property stringList coreFrameworkPaths: qtBuildVariant === "debug"
            ? frameworkPathsDebug : frameworkPathsRelease
    property string libNameForLinkerDebug: "Qt5Core"
    property string libNameForLinkerRelease: "Qt5Core"
    property string libNameForLinker: qtBuildVariant === "debug"
                                      ? libNameForLinkerDebug : libNameForLinkerRelease
    property string libFilePathDebug: ""
    property string libFilePathRelease: "/home/user/qt-bin/qt-linux-5.14.1-desktop/lib/libQt5Core.so.5.14.1"
    property string libFilePath: qtBuildVariant === "debug"
                                      ? libFilePathDebug : libFilePathRelease

    property stringList coreLibPaths: []

    // These are deliberately not path types
    // We don't want to resolve them against the source directory
    property string generatedHeadersDir: product.buildDirectory + "/qt.headers"
    property string qdocOutputDir: product.buildDirectory + "/qdoc_html"
    property string qmDir: product.destinationDirectory
    property string qmBaseName: product.targetName
    property bool lreleaseMultiplexMode: false

    cpp.entryPoint: qbs.targetOS.containsAny(["ios", "tvos"])
                        && Utilities.versionCompare(version, "5.6.0") >= 0
                    ? "_qt_main_wrapper"
                    : undefined
    cpp.cxxLanguageVersion: Utilities.versionCompare(version, "5.7.0") >= 0 ? "c++11" : original
    cpp.enableCompilerDefinesByLanguage: ["cpp"].concat(
        qbs.targetOS.contains("darwin") ? ["objcpp"] : [])
    cpp.defines: {
        var defines = ["QT_CORE_LIB"];
        // ### QT_NO_DEBUG must be added if the current build variant is derived
        //     from the build variant "release"
        if (!qbs.debugInformation)
            defines.push("QT_NO_DEBUG");
        if (!enableKeywords)
            defines.push("QT_NO_KEYWORDS");
        if (qbs.targetOS.containsAny(["ios", "tvos"])) {
            defines = defines.concat(["DARWIN_NO_CARBON", "QT_NO_CORESERVICES", "QT_NO_PRINTER",
                            "QT_NO_PRINTDIALOG"]);
            if (Utilities.versionCompare(version, "5.6.0") < 0)
                defines.push("main=qtmn");
        }
        return defines;
    }
    cpp.includePaths: {
        var paths = ["/home/user/qt-bin/qt-linux-5.14.1-desktop/include", "/home/user/qt-bin/qt-linux-5.14.1-desktop/include/QtCore"];
        paths.push(mkspecPath, generatedHeadersDir);
        return paths;
    }
    cpp.libraryPaths: {
        var libPaths = [libPath];
        if (staticBuild && pluginPath)
            libPaths.push(pluginPath + "/platforms");
        libPaths = libPaths.concat(coreLibPaths);
        return libPaths;
    }
    cpp.staticLibraries: {
        var libs = [];
        if (qbs.targetOS.contains('windows') && !product.consoleApplication) {
            libs = libs.concat(qtBuildVariant === "debug"
                               ? [] : []);
        }
        libs = libs.concat(staticLibs);
        return libs;
    }
    cpp.dynamicLibraries: dynamicLibs
    cpp.linkerFlags: coreLinkerFlags
    cpp.frameworkPaths: coreFrameworkPaths.concat(frameworkBuild ? [libPath] : [])
    cpp.frameworks: {
        var frameworks = coreFrameworks
        if (frameworkBuild)
            frameworks.push(libNameForLinker);
        if (qbs.targetOS.contains('ios') && staticBuild)
            frameworks = frameworks.concat(["Foundation", "CoreFoundation"]);
        if (frameworks.length === 0)
            return undefined;
        return frameworks;
    }
    cpp.rpaths: qbs.targetOS.contains('linux') ? [libPath] : undefined
    cpp.runtimeLibrary: qbs.toolchain.contains("msvc")
        ? config.contains("static_runtime") ? "static" : "dynamic"
        : original
    cpp.positionIndependentCode: versionMajor >= 5 ? true : undefined
    cpp.cxxFlags: {
        var flags = [];
        if (qbs.toolchain.contains('msvc')) {
            flags.push('/Zm200');
            if (versionMajor < 5)
                flags.push('/Zc:wchar_t-');
        }

        return flags;
    }
    cpp.cxxStandardLibrary: {
        if (qbs.targetOS.contains('darwin') && qbs.toolchain.contains('clang')
                && config.contains('c++11'))
            return "libc++";
        return original;
    }
    cpp.minimumWindowsVersion: original
    cpp.minimumMacosVersion: original
    cpp.minimumIosVersion: original
    cpp.minimumTvosVersion: original
    cpp.minimumWatchosVersion: original
    cpp.minimumAndroidVersion: original

    // Universal Windows Platform support
    cpp.windowsApiFamily: mkspecName.startsWith("winrt-") ? "pc" : undefined
    cpp.windowsApiAdditionalPartitions: mkspecPath.startsWith("winrt-") ? ["phone"] : undefined
    cpp.requireAppContainer: mkspecName.startsWith("winrt-")

    additionalProductTypes: ["qm"]

    validate: {
        var validator = new ModUtils.PropertyValidator("Qt.core");
        validator.setRequiredProperty("binPath", binPath);
        validator.setRequiredProperty("incPath", incPath);
        validator.setRequiredProperty("libPath", libPath);
        validator.setRequiredProperty("mkspecPath", mkspecPath);
        validator.setRequiredProperty("version", version);
        validator.setRequiredProperty("config", config);
        validator.setRequiredProperty("qtConfig", qtConfig);
        validator.setRequiredProperty("versionMajor", versionMajor);
        validator.setRequiredProperty("versionMinor", versionMinor);
        validator.setRequiredProperty("versionPatch", versionPatch);

        if (!staticBuild)
            validator.setRequiredProperty("pluginPath", pluginPath);

        // Allow custom version suffix since some distributions might want to do this,
        // but otherwise the version must start with a valid 3-component string
        validator.addVersionValidator("version", version, 3, 3, true);
        validator.addRangeValidator("versionMajor", versionMajor, 1);
        validator.addRangeValidator("versionMinor", versionMinor, 0);
        validator.addRangeValidator("versionPatch", versionPatch, 0);

        validator.addCustomValidator("availableBuildVariants", availableBuildVariants, function (v) {
            return v.length > 0;
        }, "the Qt installation supports no build variants");

        validator.addCustomValidator("qtBuildVariant", qtBuildVariant, function (variant) {
            return availableBuildVariants.contains(variant);
        }, "'" + qtBuildVariant + "' is not supported by this Qt installation");

        validator.addCustomValidator("qtBuildVariant", qtBuildVariant, function (variant) {
            return variant === qbs.buildVariant || !qbs.toolchain.contains("msvc");
        }, " is '" + qtBuildVariant + "', but qbs.buildVariant is '" + qbs.buildVariant
            + "', which is not allowed when using MSVC");

        validator.addFileNameValidator("resourceFileBaseName", resourceFileBaseName);

        validator.validate();
    }

    FileTagger {
        patterns: ["*.qrc"]
        fileTags: ["qrc"]
    }

    FileTagger {
        patterns: ["*.ts"]
        fileTags: ["ts"]
    }

    FileTagger {
        patterns: ["*.qdoc", "*.qdocinc"]
        fileTags: ["qdoc"]
    }

    FileTagger {
        patterns: ["*.qdocconf"]
        fileTags: ["qdocconf"]
    }

    FileTagger {
        patterns: ["*.qhp"]
        fileTags: ["qhp"]
    }

    property bool combineMocOutput: cpp.combineCxxSources

    Rule {
        name: "QtCoreMocRule"
        property string cppInput: cpp.combineCxxSources ? "cpp.combine" : "cpp"
        property string objcppInput: cpp.combineObjcxxSources ? "objcpp.combine" : "objcpp"
        inputs: [objcppInput, cppInput, "hpp"]
        auxiliaryInputs: {
            var auxInputs = ["qt_plugin_metadata"];
            if (cpp.combineCxxSources)
                auxInputs.push("cpp");
            if (cpp.combineObjcxxSources)
                auxInputs.push("objcpp");
            return auxInputs;
        }
        excludedInputs: ["unmocable"]
        outputFileTags: ["hpp", "cpp", "moc_cpp", "unmocable"]
        outputArtifacts: {
            if (input.fileTags.contains("unmocable"))
                return [];
            var mocinfo = QtMocScanner.apply(input);
            if (!mocinfo.hasQObjectMacro)
                return [];
            var artifact = { fileTags: ["unmocable"] };
            if (input.fileTags.contains("hpp")) {
                artifact.filePath = input.Qt.core.generatedHeadersDir
                        + "/moc_" + input.completeBaseName + ".cpp";
            } else {
                artifact.filePath = input.Qt.core.generatedHeadersDir
                          + '/' + input.completeBaseName + ".moc";
            }
            var amalgamate = input.Qt.core.combineMocOutput;
            artifact.fileTags.push(mocinfo.mustCompile ? (amalgamate ? "moc_cpp" : "cpp") : "hpp");
            if (mocinfo.hasPluginMetaDataMacro)
                artifact.explicitlyDependsOn = ["qt_plugin_metadata"];
            return [artifact];
        }
        prepare: {
            var cmd = new Command(Moc.fullPath(product),
                                  Moc.args(product, input, output.filePath));
            cmd.description = 'moc ' + input.fileName;
            cmd.highlight = 'codegen';
            return cmd;
        }
    }

    Rule {
        multiplex: true
        inputs: ["moc_cpp"]
        Artifact {
            filePath: "amalgamated_moc_" + product.targetName + ".cpp"
            fileTags: ["cpp", "unmocable"]
        }
        prepare: {
            var cmd = new JavaScriptCommand();
            cmd.description = "creating " + output.fileName;
            cmd.highlight = "codegen";
            cmd.sourceCode = function() {
                ModUtils.mergeCFiles(inputs["moc_cpp"], output.filePath);
            };
            return [cmd];
        }
    }

    property path resourceSourceBase
    property string resourcePrefix: "/"
    property string resourceFileBaseName: product.targetName
    Rule {
        multiplex: true
        inputs: ["qt.core.resource_data"]
        Artifact {
            filePath: product.Qt.core.resourceFileBaseName + ".qrc"
            fileTags: ["qrc"]
        }
        prepare: {
            var cmd = new JavaScriptCommand();
            cmd.description = "generating " + output.fileName;
            cmd.sourceCode = function() {
                var doc = new Xml.DomDocument("RCC");

                var rccNode = doc.createElement("RCC");
                rccNode.setAttribute("version", "1.0");
                doc.appendChild(rccNode);

                var inputsByPrefix = {}
                for (var i = 0; i < inputs["qt.core.resource_data"].length; ++i) {
                    var inp = inputs["qt.core.resource_data"][i];
                    var prefix = inp.Qt.core.resourcePrefix;
                    var inputsList = inputsByPrefix[prefix] || [];
                    inputsList.push(inp);
                    inputsByPrefix[prefix] = inputsList;
                }

                for (var prefix in inputsByPrefix) {
                    var qresourceNode = doc.createElement("qresource");
                    qresourceNode.setAttribute("prefix", prefix);
                    rccNode.appendChild(qresourceNode);

                    for (var i = 0; i < inputsByPrefix[prefix].length; ++i) {
                        var inp = inputsByPrefix[prefix][i];
                        var fullResPath = inp.filePath;
                        var baseDir = inp.Qt.core.resourceSourceBase;
                        var resAlias = baseDir
                            ? FileInfo.relativePath(baseDir, fullResPath) : inp.fileName;

                        var fileNode = doc.createElement("file");
                        fileNode.setAttribute("alias", resAlias);
                        qresourceNode.appendChild(fileNode);

                        var fileTextNode = doc.createTextNode(fullResPath);
                        fileNode.appendChild(fileTextNode);
                    }
                }

                doc.save(output.filePath, 4);
            };
            return [cmd];
        }
    }

    Rule {
        inputs: ["qrc"]

        Artifact {
            filePath: "qrc_" + input.completeBaseName + ".cpp"
            fileTags: ["cpp"]
        }
        prepare: {
            var cmd = new Command(product.Qt.core.binPath + '/rcc',
                                  [input.filePath, '-name',
                                   FileInfo.completeBaseName(input.filePath),
                                   '-o', output.filePath]);
            cmd.description = 'rcc ' + input.fileName;
            cmd.highlight = 'codegen';
            return cmd;
        }
    }

    Rule {
        inputs: ["ts"]
        multiplex: lreleaseMultiplexMode

        Artifact {
            filePath: FileInfo.joinPaths(product.Qt.core.qmDir,
                    (product.Qt.core.lreleaseMultiplexMode
                     ? product.Qt.core.qmBaseName
                     : input.baseName) + ".qm")
            fileTags: ["qm"]
        }

        prepare: {
            var inputFilePaths;
            if (product.Qt.core.lreleaseMultiplexMode)
                inputFilePaths = inputs["ts"].map(function(artifact) { return artifact.filePath; });
            else
                inputFilePaths = [input.filePath];
            var args = ['-silent', '-qm', output.filePath].concat(inputFilePaths);
            var cmd = new Command(product.Qt.core.binPath + '/'
                                  + product.Qt.core.lreleaseName, args);
            cmd.description = 'Creating ' + output.fileName;
            cmd.highlight = 'filegen';
            return cmd;
        }
    }

    Rule {
        inputs: "qdocconf-main"
        explicitlyDependsOn: ["qdoc", "qdocconf"]

        outputFileTags: ModUtils.allFileTags(Qdoc.qdocFileTaggers())
        outputArtifacts: Qdoc.outputArtifacts(product, input)

        prepare: {
            var outputDir = product.Qt.core.qdocOutputDir;
            var args = Qdoc.qdocArgs(product, input, outputDir);
            var cmd = new Command(product.Qt.core.binPath + '/' + product.Qt.core.qdocName, args);
            cmd.description = 'qdoc ' + input.fileName;
            cmd.highlight = 'filegen';
            cmd.environment = product.Qt.core.qdocEnvironment;
            cmd.environment.push("OUTDIR=" + outputDir); // Qt 4 replacement for -outputdir
            return cmd;
        }
    }

    Rule {
        inputs: "qhp"
        auxiliaryInputs: ModUtils.allFileTags(Qdoc.qdocFileTaggers())
                .filter(function(tag) { return tag !== "qhp"; })

        Artifact {
            filePath: input.completeBaseName + ".qch"
            fileTags: ["qch"]
        }

        prepare: {
            var args = [input.filePath];
            args = args.concat(product.Qt.core.helpGeneratorArgs);
            args.push("-o");
            args.push(output.filePath);
            var cmd = new Command(product.Qt.core.binPath + "/qhelpgenerator", args);
            cmd.description = 'qhelpgenerator ' + input.fileName;
            cmd.highlight = 'filegen';
            cmd.stdoutFilterFunction = function(output) {
                return "";
            };
            return cmd;
        }
    }

    Group {
        files: [Qt["core"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
