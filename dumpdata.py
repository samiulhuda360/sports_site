import os
import sys
from django.core.management import call_command

# Set up Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'sport_site.settings')

# Setup Django. 
# This is needed because we are running a standalone script.
import django
django.setup()

# Backup original stdout
orig_stdout = sys.stdout

# Open your file with the desired encoding
with open('datadump.json', 'w', encoding='utf-8') as f:
    sys.stdout = f  # Set stdout to file
    call_command('dumpdata',
                 exclude=['contenttypes', 'auth.permission', 'admin.logentry', 'sessions.session'],
                 natural_foreign=True)
    sys.stdout = orig_stdout  # Restore original stdout
