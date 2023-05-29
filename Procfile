rest: gunicorn -c gunicorn_config.py videoserver.wsgi
work: celery -A videoserver.worker worker --pool=solo -l info