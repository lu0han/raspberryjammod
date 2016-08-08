rm python2-scripts.zip
rm python3-scripts.zip
echo AUTHENTICATION_USERNAME=None > python2-scripts/mcpipy/mcpi/security.py
echo AUTHENTICATION_PASSWORD=None >> python2-scripts/mcpipy/mcpi/security.py
chmod -R u+rw python[23]-scripts
rm -r python3-scripts
cp -r python2-scripts python3-scripts
2to3 -w -f all -x imports -x xrange -x range -x future python3-scripts
cd python3-scripts/mcpipy
rm -rf *.{bak,pyc} */*.{bak,pyc} __pycache__ */__pycache__ */*/__pycache__
cd ..
zip -9r ../python3-scripts.zip mcpipy
cd ../python2-scripts
rm mcpipy/*.pyc mcpipy/*/*.pyc mcpipy/_sunfish.*
zip -9r ../python2-scripts.zip mcpipy
rm mcpipy/*.pyc mcpipy/*/*.pyc mcpipy/_sunfish.*
cd ..
