# Robot Framework
To execute the backend and frontend tests, you can follow these steps:

### 1- Install python
**For Windows:**

* To install python with version 3.7.6 click on [this link.](https://www.python.org/downloads/release/python-376/)
* On the "File" step, click on "Windows X86-64 executable installer" to download it.
* Click on ".exe" downloaded file.

* Check option "Add Python3.7 to path" then click on "Customize installation" then "next" button.
* Set direction when you install python, example : "C:\Python\Python37"
* Click on the "next" button.
* Click on the "Install" button.  

**For Linux:**
```
apt-get install  -y python-pip
```

### 2- Install robot framework and require library
```
pip install -r requirements.txt
```

*** Command Line_Excecute test ***

robot -d results <TEST_CASES_FILE_PATH> 