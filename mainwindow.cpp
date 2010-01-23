/*=============================================================================
 Copyright (c) 2010, Mihail Szabolcs
 All rights reserved.

 Redistribution and use in source and binary forms, with or
 without modification, are permitted provided that the following
 conditions are met:

   * 	Redistributions of source code must retain the above copyright
		notice, this list of conditions and the following disclaimer.

   * 	Redistributions in binary form must reproduce the above copyright
		notice, this list of conditions and the following disclaimer in
		the documentation and/or other materials provided with the
		distribution.

   * 	Neither the name of the SexyGrep nor the names of its contributors
		may be used to endorse or promote products derived from this
		software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
	ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
	LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
	OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
	SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
	INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
	CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
	ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
	THE POSSIBILITY OF SUCH DAMAGE.

	This file is part of SexyGrep.

==============================================================================*/
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QtWebKit>
#include <QMessageBox>
#include <QProcess>
#include <QFileDialog>

MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);

	//! Attach Sexy API
	connect( ui->webView->page()->mainFrame(), SIGNAL(javaScriptWindowObjectCleared()),
			 this, SLOT(attachSexyAPI()) );

	//! Hook into the title change event to keep our titles in sync
	connect(ui->webView,SIGNAL(titleChanged(QString)),this,SLOT(setWindowTitle(QString)));

	//! Load Up Main The Main Page
	ui->webView->setUrl(QUrl(QApplication::applicationDirPath()+"/ui/index.html"));
}

MainWindow::~MainWindow()
{
	delete ui;
}

void MainWindow::changeEvent(QEvent *e)
{
	QMainWindow::changeEvent(e);
	switch (e->type()) {
	case QEvent::LanguageChange:
		ui->retranslateUi(this);
		break;
	default:
		break;
	}
}

void MainWindow::attachSexyAPI(void)
{
	ui->webView->page()->mainFrame()->addToJavaScriptWindowObject( tr("SexyAPI"), this );
	//ui->webView->page()->mainFrame()->evaluateJavaScript("alert('hello')");
}

QStringList MainWindow::exec(const QString &pExe,
							 const QString &pDir)
{
	QProcess lProcess;
	lProcess.setProcessChannelMode(QProcess::MergedChannels);

	if(!pDir.isEmpty())
	{
		lProcess.setWorkingDirectory(pDir);
	}
	lProcess.start(pExe);

	if(!lProcess.waitForFinished())
	{
		return QStringList() << lProcess.errorString();
	}

	//! TODO: find a better way to do this!
	QList<QByteArray> lTempLines = lProcess.readAll().split('\n');
	QStringList lStringList;
	for(int i=0;i<lTempLines.size();i++)
	{
		QString lLine(lTempLines[i]);
		if(lLine.isEmpty())
			continue;

		lStringList.append(lLine);
	}

	return lStringList;
}

void MainWindow::alert(const QString &pMessage)
{
	QMessageBox lMessageBox;
	lMessageBox.setText(pMessage);
	lMessageBox.setWindowTitle(windowTitle());
	lMessageBox.setIcon(QMessageBox::Information);
	lMessageBox.exec();
}

void MainWindow::quit(void)
{
	close();
}

void MainWindow::windowMinimize(void)
{
	showMinimized();
}

void MainWindow::windowMaximize(void)
{
	showMaximized();
}

void MainWindow::windowResize(int pW, int pH)
{
	resize(pW,pH);
}

int MainWindow::windowWidth(void) const
{
	return width();
}
int MainWindow::windowHeight(void) const
{
	return height();
}

QStringList MainWindow::getOpenFileName(const QString &pFilter,
									const QString &pDir)
{
	return QFileDialog::getOpenFileNames(this,windowTitle(),pDir,pFilter);
}

QString MainWindow::getSaveFileName(const QString &pFilter,
									const QString &pDir)
{
	return QFileDialog::getSaveFileName(this,windowTitle(),pDir,pFilter);
}

QString MainWindow::getDirectory(const QString &pDir)
{
	return QFileDialog::getExistingDirectory(this,windowTitle(),pDir);
}

QStringList MainWindow::getArgs(void)
{
	return QApplication::arguments();
}
