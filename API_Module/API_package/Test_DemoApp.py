import requests
import unittest

    
class main(unittest.TestCase):
    global demo_url
    demo_url="http://127.0.0.1:8090"
    def setUp(self):
        
        unittest.TestCase.setUp(self)
    
    def test_1_register(self):
        url=demo_url+"/register"
        
        data = {
            "username" : "New_Account",
            "password" : "Test_password",
            "firstname": "firstname",
            "lastname" : "lastname",
            "phone"    : "112233445"
            }
        
        response = requests.request("POST", url, data=data)
        print(response)
        print(response.text)
        assert "is already registered" not in response.text


    def test_2_login(self):
        url=demo_url+"/login"
        headers={
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36"
            }
    
        login_data={
            "username" : "Test_user1",
            "password" : "Test@12345"
                }
            
        with requests.session() as s:
                
                response = s.post(url,data=login_data,headers=headers)
                assert "Login Failure"  not in response.text
                
    def test_3_get_user_data(self):
        with requests.session() as s:
            url = demo_url+"/user"
            response=s.get(url)
            print(response.text)
            
    def tearDown(self):
        with requests.session() as s:
            url=demo_url+"/logout"
            response=s.get(url)
            print(response.text)
if __name__ == '__main__':
    unittest.main()
                