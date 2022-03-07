from rest_framework.exceptions import APIException


class SymbolNotFound(APIException):
    status_code = 404
    default_detail = 'Symbol is not found'
    default_code = 'service_unavailable'
