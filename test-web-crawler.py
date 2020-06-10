import requests
import time
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

CHROME_EXECUTABLE_PATH = "./chromedriver.exe"
URI = 'http://citybus.taichung.gov.tw/ebus'
# URI = 'https://www.cwb.gov.tw/V8/C/'

def get_page_source_by_chrome():
  chrome_options = Options()
  chrome_options.add_argument('--headless')
  chrome_options.add_argument('--disable-gpu')

  driver = webdriver.Chrome(executable_path=CHROME_EXECUTABLE_PATH, chrome_options=chrome_options)
  driver.get(URI)
  # wait for quering datas
  time.sleep(2)
  page_res = driver.page_source
  return page_res

def testCrawl(): 
    page_res = get_page_source_by_chrome()
    quriedHTML = BeautifulSoup(page_res, 'html.parser')
    links = quriedHTML.find_all('a')
    # print("quriedHTML: ", quriedHTML.prettify())
    print("querid: ", links)

testCrawl()

