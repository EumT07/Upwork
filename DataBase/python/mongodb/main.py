from pymongo import MongoClient
import os
import dotenv
from bson import ObjectId

URL = os.getenv("MONGO_URL")

client = MongoClient(URL)

upwork_db = client["upwork"]
users = upwork_db["users"]

print(client.list_database_names())

# datos = [
#     {
#         "id": "6831d89efc13ae54b6285be6",
#         "username": "ahodgin0",
#         "first_name": "Arney",
#         "last_name": "Hodgin",
#         "email": "ahodgin0@last.fm",
#         "password": "$2a$04$4rdXHII3j0N6DPOdd7Epx.mc2BrkcyUtNOPcy6PB4MBApDtBlr/oO",
#         "gender": "Male",
#         "birthday": "2001-12-19",
#         "country": "US-1713",
#         "created": "2021-03-02"
#     },
#     {
#         "id": "6831d89efc13ae54b6285be7",
#         "username": "tclacson1",
#         "first_name": "Tamara",
#         "last_name": "Clacson",
#         "email": "tclacson1@nih.gov",
#         "password": "$2a$04$Phb9Dh2Xi8CYb/ll2kk6qO3eRqgzMe5mAXfCRZOy3vklwL/qWtyAG",
#         "gender": "Female",
#         "birthday": "1996-04-14",
#         "country": "NO-9824",
#         "created": "2024-05-31"
#     }
# ]

# new_data = []
# for documento in datos:
#     documento['_id'] = documento.pop('id')
#     new_data.append(documento)

# print(new_data)