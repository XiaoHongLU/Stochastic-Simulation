find Simulate/src -name \*.java > javafile
if [ -d Simulate/bin ]
then
	javac -cp "./Simulate/bin:/lib/*" -d Simulate/bin @javafile
else
	mkdir Simulate/bin
	javac -cp "./Simulate/bin:/lib/*" -d Simulate/bin @javafile
fi
