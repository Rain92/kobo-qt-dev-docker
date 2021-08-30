FROM archlinux:base-devel

LABEL org.opencontainers.image.authors="balduran174@gmail.com"

RUN pacman --noconfirm -Syu gperf help2man bison texinfo flex gawk git unzip \
    cmake python3 wget tar gdb qtcreator

RUN useradd --create-home user
ENV HOME /home/user
ENV USER user
ENV TERM xterm

ADD --chown=user kobo-qt-setup-scripts /home/user/kobo-qt-setup-scripts

WORKDIR /home/user/kobo-qt-setup-scripts

RUN su user -c ./install_toolchain.sh
ENV PATH="/home/${USER}/x-tools/arm-kobo-linux-gnueabihf/bin:${PATH}"

RUN su user -c ./install_libs.sh
RUN su user -c ./install_gdb.sh

RUN su user -c "./get_qt.sh kobo"
RUN su user -c "./get_qt.sh desktop"

RUN su user -c "./build_qt.sh kobo config make install"
RUN su user -c "./build_qt.sh desktop config make install"

RUN git clean -ffdx

ADD scribble /home/user/scribble
ADD UltimateMangaReader /home/user/UltimateMangaReader
ADD qt5-kobo-platform-plugin /home/user/qt5-kobo-platform-plugin

ADD koboplatformplugin.pro.user  /home/user/qt5-kobo-platform-plugin/koboplatformplugin.pro.user
ADD scribble.pro.user            /home/user/scribble/scribble.pro.user
ADD UltimateMangaReader.pro.user /home/user/UltimateMangaReader/UltimateMangaReader.pro.user

ADD QtProject /home/user/.config/QtProject
ADD QtProject.conf /home/user/.config/QtProject.conf

ADD launch.sh /launch.sh

ENTRYPOINT ["/launch.sh"]
