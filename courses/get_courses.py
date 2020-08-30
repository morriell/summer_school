#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from courses.db import get_db

def get_all_courses():
    db = get_db()

    query = ("SELECT * FROM Courses")
    cursor = db.cursor()
    cursor.execute(query)



