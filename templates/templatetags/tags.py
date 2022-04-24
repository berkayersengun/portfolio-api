import os

from django.template.defaulttags import register


@register.simple_tag
def update_next(next):
    if os.environ.get('PRO'):
        return '/api' + next
    return next
