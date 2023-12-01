import requests # pip install requests (sudo apt-get python3-requests)

url = 'http://localhost/login'
creds = {'login': 'admin', 'password': 'admin'}

s = requests.Session()

# Authenticate and get the access token
response = s.post(url, json=creds)
token = response.json()['token']
headers = {'Authorization': 'Bearer ' + token}

# Récupérer la liste de tous les utilisateurs
response_users = s.get("http://localhost/users", headers=headers)
print(response_users.json())

# Ajouter un utilisateur
new_user = {'email': 'john@example.com', 'username': 'john doe', 'password': 'password'}
response_add_user = s.post("http://localhost/users", json=new_user, headers=headers)
print(response_add_user.json())

# Modifier un utilisateur
user_udpate = {'email': 'johndoe@example.com','username': 'John Doe', 'password': 'password@'}
response_update_user = s.put("http://localhost/users/1", json=user_udpate, headers=headers)
print(response_update_user.json())

# Supprimer un utilisateur
response_delete_user = s.delete("http://localhost/users/2", headers=headers)
print(response_delete_user.json())

# Récupérer un utilisateur
response_user = s.get("http://localhost/users/1", headers=headers)
print(response_user.json())