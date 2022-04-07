#!/usr/bin/python3

"""
Adapted From http://adam.younglogic.com/2022/03/generating-a-clouds-yaml-file/ - collected 2022-04-07
"""
import os, yaml

clouds = {
   "clouds":{
        "linuxadminbooks": {
            "auth" : {
                "auth_url" : os.environ["OS_AUTH_URL"],
                "project_name": os.environ["OS_PROJECT_NAME"],
                "project_domain_name": os.environ["OS_PROJECT_DOMAIN_NAME"],
                "username": os.environ["OS_USERNAME"],
                "user_domain_name": os.environ["OS_USER_DOMAIN_NAME"],
                "password": os.environ["OS_PASSWORD"]
            }
        }
    }
}


print(yaml.dumps(clouds))
