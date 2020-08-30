#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from subprocess import Popen, PIPE

from flask import current_app as app
from flask import render_template, request,Response, send_from_directory
from courses.db import get_db
import json
import os
import re


# Serve React App
@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def serve(path):
    if path != "" and os.path.exists(app.static_folder + '/' + path):
        return send_from_directory(app.static_folder, path)
    else:
        return send_from_directory(app.static_folder,'index.html')



@app.route('/get_all_courses')
def get_courses():
    db = get_db()
    db.execute('''SELECT
    ID,
    Age_Min,
    Age_Max,
    Name,
    Descr,
    Tags,
    Active,
    Pic_URL
    FROM Courses
    ''')

    #get rows names
    row_headers = [i[0] for i in db.description]

    json_data=[]
    results = db.fetchall()
    all_tags = []

    for result in results:
        json_data.append(dict(zip(row_headers,result)))

        json_data[-1]['Tags'] = str(json_data[-1]['Tags']).split(";")
        all_tags = all_tags + json_data[-1]['Tags']
    #json_response = json.dumps(json_data, ensure_ascii=False).encode('utf8')
    all_tags = list(set(all_tags))
    json_response = json.dumps({'data':json_data, 'all_tags':all_tags},
                                ensure_ascii=False).encode('utf8')

    return Response(json_response, content_type="application/json; charset=utf-8")

@app.route('/get_course/item/<id>')
def get_course(id):
    db = get_db()
    db.execute('''SELECT
    Courses.ID,
    Courses.Age_Min,
    Courses.Age_Max,
    Courses.Name,
    Courses.Descr,
    Courses.LongDescr,
    Teachers.Name as Teacher,
    Teachers.Photo_URL as Teacher_Photo,
    Teachers.About as Teacher_About,
    Courses.Requirements,
    Courses.Best_fit,
    Courses.Skills,
    Courses.Result,
    Courses.Cost,
    Courses.Tags,
    Courses.Active,
    Courses.Pic_URL,
    Courses.Course_org,
    Courses.YouTube_hash as YouTube
    FROM Courses, Teachers WHERE Courses.ID=''' +  id + ' AND Teachers.ID=Courses.Teacher' )
    #get rows names
    row_headers = [i[0] for i in db.description]

    json_data=[]
    results = db.fetchall()

    for result in results:
        json_data.append(dict(zip(row_headers,result)))

        json_data[-1]['Best_fit'] = str(json_data[-1]['Best_fit']).split(";")
        json_data[-1]['Skills'] = str(json_data[-1]['Skills']).split(";")
        if (json_data[-1]['Cost'] != ""):
            json_data[-1]['Cost'] += ' руб.'
        else:
            json_data[-1]['Cost'] = 'Бесплатно'


        json_data[-1]['Tags'] = str(json_data[-1]['Tags']).split(";")
        if(json_data[-1]['YouTube'] is not None):
            json_data[-1]['YouTube'] = 'https://www.youtube.com/embed/' + str(json_data[-1]['YouTube'])

    #Get array for course organization
    db.execute('''SELECT
        Common_Info,
        Result,
        Escort,
        For_Parents

        FROM Course_org WHERE ID=''' + str(json_data[0]['Course_org'])
        )
    row_headers = [i[0] for i in db.description]
    add_json_data = []
    results = db.fetchall()

    for result in results:
        add_json_data.append(dict(zip(row_headers,result)))
        add_json_data[-1]['Common_Info'] = str(add_json_data[-1]['Common_Info']).split(";")
        add_json_data[-1]['Result'] = str(add_json_data[-1]['Result']).split(";")
        add_json_data[-1]['Escort'] = str(add_json_data[-1]['Escort']).split(";")
        add_json_data[-1]['For_Parents'] = str(add_json_data[-1]['For_Parents']).split(";")

    json_data[0]['Course_org'] = add_json_data[0]

    json_response = json.dumps(json_data, ensure_ascii=False).encode('utf8')


    return Response(json_response, content_type="application/json; charset=utf-8")

@app.route('/news')
def get_news():
    db = get_db()
    db.execute(
    '''
    SELECT Title,  DATE_FORMAT(date, "%d.%m.%Y") as Date, Text from News WHERE
    visibility=true order by priority;
    '''
    )

    #get rows names
    row_headers = [i[0] for i in db.description]

    json_data=[]
    results = db.fetchall()

    for result in results:
        json_data.append(dict(zip(row_headers,result)))

    resp = {'title': 'News', 'feed': json_data}

    json_response = json.dumps(resp, ensure_ascii=False).encode('utf8')
    return Response(json_response, content_type="application/json; charset=utf-8")
