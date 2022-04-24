import os
## Export env variables to django templates
def export_vars(request):
    data = {}
    data['SETTING_TYPE'] = os.environ['SHELL']
    return data