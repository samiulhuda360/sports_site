from django import template
from bs4 import BeautifulSoup

register = template.Library()

@register.filter
def remove_headings(value):
    soup = BeautifulSoup(value, features="html.parser")
    for h in soup.find_all(['h1', 'h2', 'h3', 'h4', 'h5', 'h6']):
        h.extract()
    return str(soup)

@register.filter
def get_range(value):
    return range(value)

@register.filter
def add_one(value):
    return str(int(value) + 1)

@register.filter
def split_string(value, delimiter):
    return value.split(delimiter)