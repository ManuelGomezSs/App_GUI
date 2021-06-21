# This Python file uses the following encoding: utf-8
import sys
import os

from PyQt5 import QtWidgets, QtSql
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)



if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Get Context
    main = MainWindow()

    # Load QML file
    engine.load(os.path.join(os.path.dirname(__file__), "qml/login.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
