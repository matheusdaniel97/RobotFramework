#Creating a file to manage database
from robot.api.deco import keyword
from pymongo import MongoClient

#Define cluster
client = MongoClient('mongodb+srv://qa:Matheus@cluster0.9m66x.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')

#Define db
db = client['markdb']

#Method to remove a created user by email
@keyword('Remove user from database')
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print('removing user by ' + email)

@keyword('Insert user from database')
def insert_user(user):
    #doc = {
    #    'name': name,
    #    'email': email,
    #    'password': password
    #}

    users = db['users']
    users.insert_one(user)
    print(user)