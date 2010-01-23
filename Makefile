#############################################################################
# Makefile for building: SexyGrep
# Generated by qmake (2.01a) (Qt 4.7.0) on: Sat Jan 23 16:29:47 2010
# Project:  SexyGrep.pro
# Template: app
# Command: /opt/qt-git/bin/qmake -spec /opt/qt-git/mkspecs/linux-g++ -unix CONFIG+=debug -o Makefile SexyGrep.pro
#############################################################################

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_WEBKIT_LIB -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
CFLAGS        = -pipe -g -Wall -W -D_REENTRANT $(DEFINES)
CXXFLAGS      = -pipe -g -Wall -W -D_REENTRANT $(DEFINES)
INCPATH       = -I/opt/qt-git/mkspecs/linux-g++ -I. -I/opt/qt-git/include/QtCore -I/opt/qt-git/include/QtGui -I/opt/qt-git/include/QtWebKit -I/opt/qt-git/include -I. -I.
LINK          = g++
LFLAGS        = -Wl,-rpath,/opt/qt-git/lib
LIBS          = $(SUBLIBS)  -L/opt/qt-git/lib -lQtWebKit -L/opt/qt-git/lib -L/usr/X11R6/lib -lphonon -lQtDBus -lQtXml -lQtXmlPatterns -lQtNetwork -lQtGui -lQtCore -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /opt/qt-git/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = main.cpp \
		mainwindow.cpp moc_mainwindow.cpp
OBJECTS       = main.o \
		mainwindow.o \
		moc_mainwindow.o
DIST          = /opt/qt-git/mkspecs/common/g++.conf \
		/opt/qt-git/mkspecs/common/unix.conf \
		/opt/qt-git/mkspecs/common/linux.conf \
		/opt/qt-git/mkspecs/qconfig.pri \
		/opt/qt-git/mkspecs/features/qt_functions.prf \
		/opt/qt-git/mkspecs/features/qt_config.prf \
		/opt/qt-git/mkspecs/features/exclusive_builds.prf \
		/opt/qt-git/mkspecs/features/default_pre.prf \
		/opt/qt-git/mkspecs/features/debug.prf \
		/opt/qt-git/mkspecs/features/default_post.prf \
		/opt/qt-git/mkspecs/features/warn_on.prf \
		/opt/qt-git/mkspecs/features/qt.prf \
		/opt/qt-git/mkspecs/features/unix/thread.prf \
		/opt/qt-git/mkspecs/features/moc.prf \
		/opt/qt-git/mkspecs/features/resources.prf \
		/opt/qt-git/mkspecs/features/uic.prf \
		/opt/qt-git/mkspecs/features/yacc.prf \
		/opt/qt-git/mkspecs/features/lex.prf \
		/opt/qt-git/mkspecs/features/include_source_dir.prf \
		SexyGrep.pro
QMAKE_TARGET  = SexyGrep
DESTDIR       = 
TARGET        = SexyGrep

first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET): ui_mainwindow.h $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: SexyGrep.pro  /opt/qt-git/mkspecs/linux-g++/qmake.conf /opt/qt-git/mkspecs/common/g++.conf \
		/opt/qt-git/mkspecs/common/unix.conf \
		/opt/qt-git/mkspecs/common/linux.conf \
		/opt/qt-git/mkspecs/qconfig.pri \
		/opt/qt-git/mkspecs/features/qt_functions.prf \
		/opt/qt-git/mkspecs/features/qt_config.prf \
		/opt/qt-git/mkspecs/features/exclusive_builds.prf \
		/opt/qt-git/mkspecs/features/default_pre.prf \
		/opt/qt-git/mkspecs/features/debug.prf \
		/opt/qt-git/mkspecs/features/default_post.prf \
		/opt/qt-git/mkspecs/features/warn_on.prf \
		/opt/qt-git/mkspecs/features/qt.prf \
		/opt/qt-git/mkspecs/features/unix/thread.prf \
		/opt/qt-git/mkspecs/features/moc.prf \
		/opt/qt-git/mkspecs/features/resources.prf \
		/opt/qt-git/mkspecs/features/uic.prf \
		/opt/qt-git/mkspecs/features/yacc.prf \
		/opt/qt-git/mkspecs/features/lex.prf \
		/opt/qt-git/mkspecs/features/include_source_dir.prf \
		/opt/qt-git/lib/libQtWebKit.prl \
		/opt/qt-git/lib/libphonon.prl \
		/opt/qt-git/lib/libQtDBus.prl \
		/opt/qt-git/lib/libQtXml.prl \
		/opt/qt-git/lib/libQtCore.prl \
		/opt/qt-git/lib/libQtGui.prl \
		/opt/qt-git/lib/libQtXmlPatterns.prl \
		/opt/qt-git/lib/libQtNetwork.prl
	$(QMAKE) -spec /opt/qt-git/mkspecs/linux-g++ -unix CONFIG+=debug -o Makefile SexyGrep.pro
/opt/qt-git/mkspecs/common/g++.conf:
/opt/qt-git/mkspecs/common/unix.conf:
/opt/qt-git/mkspecs/common/linux.conf:
/opt/qt-git/mkspecs/qconfig.pri:
/opt/qt-git/mkspecs/features/qt_functions.prf:
/opt/qt-git/mkspecs/features/qt_config.prf:
/opt/qt-git/mkspecs/features/exclusive_builds.prf:
/opt/qt-git/mkspecs/features/default_pre.prf:
/opt/qt-git/mkspecs/features/debug.prf:
/opt/qt-git/mkspecs/features/default_post.prf:
/opt/qt-git/mkspecs/features/warn_on.prf:
/opt/qt-git/mkspecs/features/qt.prf:
/opt/qt-git/mkspecs/features/unix/thread.prf:
/opt/qt-git/mkspecs/features/moc.prf:
/opt/qt-git/mkspecs/features/resources.prf:
/opt/qt-git/mkspecs/features/uic.prf:
/opt/qt-git/mkspecs/features/yacc.prf:
/opt/qt-git/mkspecs/features/lex.prf:
/opt/qt-git/mkspecs/features/include_source_dir.prf:
/opt/qt-git/lib/libQtWebKit.prl:
/opt/qt-git/lib/libphonon.prl:
/opt/qt-git/lib/libQtDBus.prl:
/opt/qt-git/lib/libQtXml.prl:
/opt/qt-git/lib/libQtCore.prl:
/opt/qt-git/lib/libQtGui.prl:
/opt/qt-git/lib/libQtXmlPatterns.prl:
/opt/qt-git/lib/libQtNetwork.prl:
qmake:  FORCE
	@$(QMAKE) -spec /opt/qt-git/mkspecs/linux-g++ -unix CONFIG+=debug -o Makefile SexyGrep.pro

dist: 
	@$(CHK_DIR_EXISTS) .tmp/SexyGrep1.0.0 || $(MKDIR) .tmp/SexyGrep1.0.0 
	$(COPY_FILE) --parents $(SOURCES) $(DIST) .tmp/SexyGrep1.0.0/ && $(COPY_FILE) --parents mainwindow.h .tmp/SexyGrep1.0.0/ && $(COPY_FILE) --parents main.cpp mainwindow.cpp .tmp/SexyGrep1.0.0/ && $(COPY_FILE) --parents mainwindow.ui .tmp/SexyGrep1.0.0/ && (cd `dirname .tmp/SexyGrep1.0.0` && $(TAR) SexyGrep1.0.0.tar SexyGrep1.0.0 && $(COMPRESS) SexyGrep1.0.0.tar) && $(MOVE) `dirname .tmp/SexyGrep1.0.0`/SexyGrep1.0.0.tar.gz . && $(DEL_FILE) -r .tmp/SexyGrep1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: moc_mainwindow.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_mainwindow.cpp
moc_mainwindow.cpp: mainwindow.h
	/opt/qt-git/bin/moc $(DEFINES) $(INCPATH) mainwindow.h -o moc_mainwindow.cpp

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: ui_mainwindow.h
compiler_uic_clean:
	-$(DEL_FILE) ui_mainwindow.h
ui_mainwindow.h: mainwindow.ui
	/opt/qt-git/bin/uic mainwindow.ui -o ui_mainwindow.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_uic_clean 

####### Compile

main.o: main.cpp mainwindow.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

mainwindow.o: mainwindow.cpp mainwindow.h \
		ui_mainwindow.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o mainwindow.o mainwindow.cpp

moc_mainwindow.o: moc_mainwindow.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_mainwindow.o moc_mainwindow.cpp

####### Install

install:   FORCE

uninstall:   FORCE

FORCE:
