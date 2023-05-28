from django import template
from datetime import datetime

register = template.Library()

@register.simple_tag
def calculate_age(birth_year):
    return datetime.now().year - int(birth_year)

@register.simple_tag
def current_year():
    return datetime.now().year
