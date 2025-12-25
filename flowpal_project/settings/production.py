from .base import *
from .databases import *
from .drf import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = config('DJANGO_DEBUG', default=False, cast=bool)

ENVIRONMENT = config('ENVIRONMENT', default='production')

ALLOWED_HOSTS = [
    'productiondomain.com',
]