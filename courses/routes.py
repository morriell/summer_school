#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from subprocess import Popen, PIPE

from flask import current_app as app
from flask import render_template, request
from flask import url_for

@app.route('/get_all_courses')
def get_all_courses():
    return

@app.route('/get_course/<id>')
def get_course(id):
    return

