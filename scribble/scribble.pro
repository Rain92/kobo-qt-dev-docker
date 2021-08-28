QT += widgets core
requires(qtConfig(filedialog))

HEADERS       = mainwindow.h \
                scribblearea.h \
                stacktrace.h
SOURCES       = main.cpp \
                mainwindow.cpp \
                scribblearea.cpp

QTPLUGIN.platforms += koboplatformplugin

target.path = /mnt/onboard/.adds/scribble
INSTALLS += target
