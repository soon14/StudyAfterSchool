urlpatterns = [
    url(r'^view=(?P<path>.*)$', views.view, name='view')
]

def view(request,path):

    return HttpResponse("hello view")



接收参数