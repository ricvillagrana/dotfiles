import sys, json, requests

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

uri = 'https://programming-quotes-api.herokuapp.com/quotes/random'
response = requests.get(uri)
data = json.loads(response.text)

print("\n\n")
print(bcolors.OKGREEN + data['en'] + '"' + bcolors.ENDC)
print()
print(bcolors.BOLD + "–" + data['author'] + bcolors.ENDC)
print("\n\n")
