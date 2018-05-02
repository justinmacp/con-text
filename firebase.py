import firebase_admin
from firebase_admin import credentials
from firebase_admin import auth
from firebase_admin import db

class firebase():
	cred = credentials.Certificate('honey-b7143-firebase-adminsdk-sfwyp-6c9f1a519a.json')
	default_app = firebase_admin.initialize_app(cred, {'databaseURL' : 'https://honey-b7143.firebaseio.com/'})
'''
# Get ISBN numbers only (saves it in ISBN as list)
results = db.reference().child('ISBN_numbers').get()
ISBN = results.keys()

# Get ISBN numbers with rating only (needed for testing)
ISBN = db.reference().child('ISBN_numbers').order_by_child('rating').start_at(0).end_at(100).get().keys()

listURL = []

# Get links for each ISBN number in database (this might not be working)
listURL = []
ISBN = db.reference().child('ISBN_numbers').get().keys()

for x in ISBN:
		for z, y in db.reference().child('ISBN_numbers').child(x).get().items():
			if (z == '0' or z == '1' or z == '2' or z == '3' or z == '4' or z == '5' or z == '6' or z == '7' or z == '8' or z == '9' or z == '10' or z == '11' or z == '12' or z == '13' or z == '14' or z == '15' or z == '16' or z == '17' or z == '18' or z == '19' or z == '20' or z == '21' or z == '22' or z == '23' or z == '24' or z == '25' or z == '26' or z == '27' or z == '28' or z == '29' or z == '30'):
				if (str(y).startswith('http')):
					listURL = listURL + y.split()
print listURL

#Find ISBN number using link
for u in range(30):
	num = db.reference().child('ISBN_numbers').order_by_child(str(u)).equal_to(*insert link here*).get().keys() #change 10 back to str(x) and link
	if (len(num) > 0):
		final_num = num
print final_num

# To get rating based on ISBN number (needed for testing)
db.reference().child('ISBN_numbers').child(**insert ISBN number with quotes here**).child('rating').get()

# Get reviews of an ISBN number (needed for testing)
for x in range(30):
	child = 'review_' + str(x)
	db.reference().child('ISBN_numbers').child('9781594206139').child(child).get()

# get author using ISBN number
db.reference().child('ISBN_numbers').child('9781594206139').child('author').get()


#updates if key exists, adds if doesn't
db.reference().child('Pre Processing').update({'Author':'name'})
for x in file[0]:
	db.reference().child('ISBN_numbers').update({ISBN:file[0][x][0]})
'''


