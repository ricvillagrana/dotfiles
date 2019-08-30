import sys, json, yaml, requests

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

api_url = 'https://api.github.com/'

repos = yaml.load(open('./repos.yml', 'r'))['repos']

for repo in repos:
    response = response = requests.get(api_url + 'repos/' + repo)
    data = json.loads(response.text)

    print(bcolors.BOLD + bcolors.OKBLUE + data['full_name'] + bcolors.ENDC)
    #  print(bcolors.UNDERLINE + data['description'] + '"' + bcolors.ENDC)
    print('\t Stars: ', data['stargazers_count'])
    print('\t Watchers: ', data['watchers_count'])
    print('\t Language: ', data['language'])
    print('\t Opened issues: ', data['stargazers_count'])
