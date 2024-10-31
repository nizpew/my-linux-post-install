#!/usr/bin/python3

from bs4 import BeautifulSoup
from selenium.webdriver.chrome.options import Options
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.action_chains import ActionChains
from time import sleep
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import os
from selenium import webdriver
from selenium.webdriver.common.by import By




#kkep i open after finishing





#---------------------------------------------------------------------UA's (EXERCICIOS/LEITURAS) --------------------------------------------------------------------------------------
# '-u' = UA's

















#---------------------------------------------------------------------TIMELINE NOTIFICATION--------------------------------------------------------------------------------------

# '-t' = timeline



driver = webdriver.Chrome()


##driver.get("https://duckduckgo.com/?t=ffab&q=chrome+driver+closes+alone&ia=web")
driver.get("https://ea.uniceub.br")


#function looping (to it dont close alone)
##login("Mail", "Password", driver)



#driver.quit()



##chrome_options = Options()
##chrome_options.add_experimental_option("detach", True)
#wait
##driver.implicitly_wait(5)



#------------------------------------------------------imput login and click button-------------------------------------------------------------

#find and imput user
##user = driver.find_element(By.ID, "coAcesso").clear()
##driver.implicitly_wait(5)
driver.find_element(By.ID, "coAcesso").send_keys("22402267" )
##driver.implicitly_wait(5)
#pass
##password = driver.find_element(By.ID, "coSenha").clear()
driver.find_element(By.ID, "coSenha").send_keys("Haroldo34%" )
## driver.findElement(By.id(“coSenha”));
##driver.implicitly_wait(5)

#click on button
driver.find_element(By.ID, "btn-login").click()

###clickable = driver.find_element(By.XPATH, '//*[@id="btn-login"]')
###ActionChains(driver)\
###.click(clickable)\
###.perform()


#wait 
#driver.implicitly_wait(10)


#scrapping notifications
    ##find_element_by_class_name("text-left").find_elements_by_tag_name('small')
   ## notifications_text = driver.find_element(By.CLASS_NAME, "text-000 tex")

    
    
    #trying bs
        #find div id
   ## notifications_text = soup.find(id="loadrtimeline")
###html = driver.page_source

###soup = BeautifulSoup(html)
###print(soup.get_text())


#-----------------------------------get html----------------------------------

####print(driver.page_source)


##soup.a

##el = soup.find("strong") # 👉️ Find <p>

##el_text = el.string 


    #print notf.

##print(el_text)


#------------------------------------------------------interpreting javascript from html-------------------------------------------------------------






##pageSource = driver.page_source

try:
    # Espera até que o botão esteja presente na página
    botao = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".icon.ea-icon-notificacoes.ea-icon-notificacoes-dims")))
    
    # Clica no botão
    botao.click()

    texto_notificacoes = WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.CSS_SELECTOR, "[data-bind='text:DeNuTotalNotificacoes']"))).text
    print("Número de notificações:", texto_notificacoes)
    botao2 = WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.CSS_SELECTOR, "[data-bind='text:DeNuTotalNotificacoes']")))
    botao2.click()
    




    import time
    time.sleep(6) # Sleep for 3 seconds

   
# Execute JavaScript to get text from all elements with class "text-left"
    texts = driver.execute_script('''
        var elements = document.querySelectorAll('.text-left');
        var texts = [];
        elements.forEach(function(element) {
            texts.push(element.textContent.trim());
        });
        return texts;
    ''')


    for i in range(11, 14):
        text = texts[i]
        if text:  # Check if text is not empty
            print("Text from element:", text)




# Print the extracted text
#    for text in texts:
#        if text:  # Check if text is not empty
#            print(text)







    #pageSource = driver.execute_script("return document.body.innerHTML;")
    #print(pageSource)
#scrap from html output, "</span> lol </span> "

finally:

    #pageSource = driver.execute_script("return document.body.innerHTML;")
    #print(pageSource)

    #print("finished")



####driver.quit()


# Saída do programa (exemplo)
    output = texto_notificacoes

# Caminho para a pasta onde você deseja salvar o arquivo
    pasta_destino = "Documents/constant-files/"

# Nome do arquivo de saída
    nome_arquivo = "webcrawl-if-theres-notifications"

# Verifica se a pasta de destino existe, se não, cria-a
    if not os.path.exists(pasta_destino):
     os.makedirs(pasta_destino)

# Caminho completo para o arquivo de saída
    caminho_arquivo = os.path.join(pasta_destino, nome_arquivo)

# Salva a saída em um arquivo
    with open(caminho_arquivo, "w") as f:
        f.write(output)

    print("Saída salva em:", caminho_arquivo)



#keep browser open

input()



#-------------------------------------------------------------------------------------------------------------------
