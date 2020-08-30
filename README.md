# summer\_school
A cool site on flask for advertaising courses for summer school 1505, year 2020.

Create a MySQL DB and fill in it's credentials in config.py

Install pip and create a virtual. I've called it SummerSchool so this name is used further.

Venvconf:

|Package        | Version |
|---------------|---------|
|click           |7.1.2|
|Flask           |1.1.2|
|itsdangerous    |1.1.0|
|Jinja2          |2.11.2|
|jsonify         |0.5|
|MarkupSafe      |1.1.1|
|mysql-connector |2.2.9|
|pip             |20.1.1|
|pkg-resources   |0.0.0|
|setuptools      |20.7.0|
|uWSGI           |2.0.18|
|Werkzeug        |1.0.1|

and start it:
```
    source SummerSchool/bin/activate
```
Place `deploy\_configs/uwsgi.ini` to `/etc/uwsgi.ini`

Place `deploy\_configs/SummerSchool.conf` to nginx conf folder (e.g. `/etc/nginx/sites-enabled/SummerSchool.conf`)

Place static files compiled by react to `courses/static`. Remember to leave `courses/static/pictures` folder on place!

Remember to chown all files in a folder to **www-data**

To start server: 
```
   uwsgi --ini /etc/uwsgi.ini &
```

To kill server:
```
    killall uwsgi -9
```
