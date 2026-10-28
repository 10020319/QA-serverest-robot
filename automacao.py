from appium import webdriver
from appium.options.android import UiAutomator2Options

options = UiAutomator2Options()
options.platform_name = "Android"
options.device_name = "XGV4TGJNRWNJO74L"
options.automation_name = "UiAutomator2"
options.app_package = "com.whatsapp.w4b"
options.app_activity = "com.whatsapp.registration.app.EULA"

driver = webdriver.Remote(
    "http://127.0.0.1:4723",
    options=options
)

print("Conectou ao celular!")

input("Pressione ENTER para fechar...")

driver.quit()