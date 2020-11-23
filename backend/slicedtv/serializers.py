from django.contrib.auth.models import User

class ViewerSerializer(serialiazer.ModelSerializer):
    class Meta:
        model=User
        fields=['id','username']
    
class AdminSerializer(serialiazer.ModelSerializer):
    is_superuser = True
    class Meta:
        model=User
        fields=['id','username','is_superuser']
    
