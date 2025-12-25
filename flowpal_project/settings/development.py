from .base import *
from .databases import *
from .drf import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = config('DJANGO_DEBUG', default=True, cast=bool)
ENVIRONMENT = config('ENVIRONMENT', default='development')

ALLOWED_HOSTS = [
    'localhost',
    '127.0.0.1',
    '172.20.0.1',
    '*'
]

print("Development settings loaded.")