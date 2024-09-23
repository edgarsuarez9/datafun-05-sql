## Commands Used

```
git add .
git commit -m "initial commit"
git push -u origin main
```
## How to Import Dependencies

#Option 1
111
py -m pip install jupyterlab
py -m pip install numpy
py -m pip install pandas
py -m pip install matplotlib 
py -m pip install seaborn
py -m pip install scipy
```
#Option 2
```
py -m pip install jupyterlab numpy pandas matplotlib seaborn scipy
```

#Option 3
Create a file in the root folder of your repo (same level as the README.md) named requirements.txt with the following content. 

Install the packages listed in the requirements file with this command:

```
py -m pip install -r requirements.txt
```

I created the requirement.txt. I then input the depenedies in the file, one per line. From there I used option 3, or, py -m pip install -r requirements.txt
