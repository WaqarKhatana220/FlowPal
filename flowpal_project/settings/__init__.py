"""
Django settings package initialization.

Automatically loads the appropriate settings module based on the ENVIRONMENT variable.
"""

import os
from decouple import config

# Determine which settings module to use
ENVIRONMENT = config('ENVIRONMENT', default='development')

if ENVIRONMENT == 'production':
    from .production import *
else:
    from .development import *
