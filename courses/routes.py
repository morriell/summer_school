#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from subprocess import Popen, PIPE

from flask import current_app as app
from flask import render_template, request
#from flask import url_for
#from get_courses import get_all_courses
from courses.db import get_db
import json


@app.route('/get_all_courses')
def get_courses():
    db = get_db()
    db.execute('''SELECT * FROM Courses''')

    #get rows names
    row_headers = [i[0] for i in db.description]

    json_data=[]
    results = db.fetchall()

    for result in results:
        json_data.append(dict(zip(row_headers,result)))

    return json.dumps(json_data, ensure_ascii=False).encode('utf8')

@app.route('/get_course/<id>')
def get_course(id):
    return

